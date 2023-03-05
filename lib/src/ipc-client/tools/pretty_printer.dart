import 'dart:convert';
import 'dart:io';

import '../models/ipc_payload_type.dart';
import '../models/status.dart';

class PrettyPrinter {
  static String prettyJson(jsonObject) {
    var encoder = const JsonEncoder.withIndent("  ");
    return encoder.convert(jsonObject);
  }

  static prettyPrintCmd(dynamic r) {
    if (r is! Map || !Status.successObject(r)) {
      dynamic error;
      if (r is Map) {
        error = r["error"];
      }

      if (error == null || error is! String) {
        stdout.write("An unknkown error occurred");
      } else {
        stdout.write("Error: $error\n");
      }
    }
  }

  static prettyPrintWorkspace(dynamic w) {
    if (w == null || w is! Map) {
      return;
    }
    dynamic name = w["name"];
    // dynamic rect = w["rect"];
    dynamic visible = w["visible"];
    dynamic output = w["output"];
    dynamic urgent = w["urgent"];
    dynamic layout = w["layout"];
    dynamic representation = w["representation"];
    dynamic focused = w["focused"];

    stdout.write(
        "Workspace $name${focused ? " (focused)" : ""}${!visible ? " (off-screen)" : ""}${urgent ? " (urgent)" : ""}\n"
        "  Output: $output\n"
        "  Layout: $layout\n"
        "  Representation: $representation\n\n");
  }

  static String prettyTypeName(String name) {
    // TODO: these constants probably belong in the common lib
    Map<String, String> typeNames = {
      "keyboard": "Keyboard",
      "pointer": "Mouse",
      "touchpad": "Touchpad",
      "tablet_pad": "Tablet pad",
      "tablet_tool": "Tablet tool",
      "touch": "Touch",
      "switch": "Switch",
    };

    final pretty = typeNames[name];

    if (pretty != null) {
      return pretty;
    }

    return name;
  }

  static prettyPrintInput(dynamic i) {
    if (i == null || i is! Map) {
      return;
    }
    dynamic id = i["identifier"];
    dynamic name = i["name"];
    dynamic type = i["type"];
    dynamic product = i["product"];
    dynamic vendor = i["vendor"];

    final String fmt = "Input device: $name\n"
        "  Type: ${prettyTypeName(type)}\n"
        "  Identifier: $id\n"
        "  Product ID: $product\n"
        "  Vendor ID: $vendor\n";

    stdout.write(fmt);

    dynamic kbdlayout = i["xkb_active_layout_name"];
    if (kbdlayout == null) {
      stdout.write("  Active Keyboard Layout: (unnamed)\n");
    } else {
      stdout.write("  Active Keyboard Layout: $kbdlayout\n");
    }

    dynamic libinput = i["libinput"];
    if (libinput != null && libinput is Map) {
      dynamic events = libinput["send_events"];
      if (events != null) {
        stdout.write("  Libinput Send Events: $events\n");
      }
    }

    stdout.write("\n");
  }

  static prettyPrintSeat(dynamic i) {
    if (i == null || i is! Map) {
      return;
    }
    dynamic name = i["name"];
    dynamic capabilities = i["capabilities"];
    dynamic devices = i["devices"];

    final String fmt = "Seat: $name\n"
        "  Capabilities: $capabilities\n";

    stdout.write(fmt);

    if (devices is List && devices.isNotEmpty) {
      stdout.write("  Devices:\n");
      for (final device in devices) {
        if (device is Map) {
          dynamic deviceName = device["name"];
          if (deviceName != null) {
            stdout.write("    $deviceName\n");
          }
        }
      }
    }

    stdout.write("\n");
  }

  static prettyPrintOutput(dynamic o) {
    if (o == null || o is! Map) {
      return;
    }
    dynamic name = o["name"];
    dynamic rect = o["rect"];
    dynamic focused = o["focused"];
    dynamic active = o["active"];
    dynamic power = o["power"];
    dynamic ws = o["current_workspace"];
    dynamic nonDesktop = o["non_desktop"];

    dynamic make = o["make"];
    dynamic model = o["model"];
    dynamic serial = o["serial"];
    dynamic scale = o["scale"];
    dynamic scaleFilter = o["scale_filter"];
    dynamic subpixel = o["subpixel_hinting"];
    dynamic transform = o["transform"];
    dynamic maxRenderTime = o["max_render_time"];
    dynamic adaptiveSyncStatus = o["adaptive_sync_status"];

    dynamic x = rect["x"];
    dynamic y = rect["y"];

    dynamic modes = o["modes"];
    dynamic currentMode = o["current_mode"];

    dynamic width = currentMode["width"];
    dynamic height = currentMode["height"];
    dynamic refresh = currentMode["refresh"];

    if (nonDesktop == true) {
      stdout.write("Output $name '$make $model $serial' (non-desktop)\n");
    } else if (active == true) {
      stdout.write(
          "Output $name '$make $model $serial'${focused ? " (focused)" : ""}\n"
          "  Current mode: ${width}x$height @ ${refresh / 1000} Hz\n"
          "  Power: ${power ? "on" : "off"}\n"
          "  Position: $x,$y\n"
          "  Scale factor: $scale\n"
          "  Scale filter: $scaleFilter\n"
          "  Subpixel hinting: $subpixel\n"
          "  Transform: $transform\n"
          "  Workspace: $ws\n");

      stdout.write("  Max render time: ");
      stdout.write(maxRenderTime == 0 ? "off\n" : "$maxRenderTime ms\n");

      stdout.write("  Adaptive sync: $adaptiveSyncStatus\n");
    } else {
      stdout.write("Output $name '$make $model $serial' (disabled)\n");
    }

    if (modes is List && modes.isNotEmpty) {
      stdout.write("  Available modes:\n");
      for (final mode in modes) {
        if (mode is! Map) {
          continue;
        }
        dynamic modeWidth = mode["width"];
        dynamic modeHeight = mode["height"];
        dynamic modeRefresh = mode["refresh"];
        dynamic modePictureAspectRatio = mode["picture_aspect_ratio"];

        stdout.write("    ${modeWidth}x$modeHeight @ ${modeRefresh / 1000} Hz");

        if (modePictureAspectRatio != null &&
            modePictureAspectRatio != "none") {
          stdout.write(" ($modePictureAspectRatio)");
        }

        stdout.write("\n");
      }
    }

    stdout.write("\n");
  }

  static prettyPrintVersion(dynamic v) {
    if (v == null || v is! Map) {
      return;
    }

    dynamic ver = v["human_readable"];
    final String str = jsonEncode(ver);
    stdout.write("compositor version $str\n");
  }

  static prettyPrintConfig(dynamic c) {
    if (c == null || c is! Map) {
      return;
    }

    dynamic config = c["config"];
    final String str = prettyJson(config);
    stdout.write("$str\n");
  }

  static prettyPrintTree(dynamic obj, int indent) {
    if (obj == null || obj is! Map) {
      return;
    }

    for (int i = 0; i < indent; i++) {
      stdout.write("  ");
    }

    dynamic id = obj["id"];
    dynamic name = obj["name"];
    dynamic type = obj["type"];
    dynamic shell = obj["shell"];

    stdout.write("#$id: $type \"$name\"");

    if (shell != null) {
      dynamic pid = obj["pid"];
      dynamic appId = obj["app_id"];
      dynamic windowPropsObj = obj["window_properties"];

      dynamic instance = (windowPropsObj != null && windowPropsObj is Map)
          ? windowPropsObj["instance"]
          : null;

      dynamic clazz = (windowPropsObj != null && windowPropsObj is Map)
          ? windowPropsObj["class"]
          : null;

      dynamic x11Id = obj["window"];

      stdout.write(" ($shell, pid: $pid");
      if (appId != null) {
        stdout.write(", app_id: \"$appId\"");
      }

      if (instance != null) {
        stdout.write(", instance: \"$instance\"");
      }

      if (clazz != null) {
        stdout.write(", class: \"$clazz\"");
      }

      if (x11Id != null && x11Id is int) {
        if (x11Id != 0) {
          stdout.write(", X11 window: 0x${x11Id.toRadixString(16)}");
        }
      }

      stdout.write(")");
    }

    stdout.write("\n");

    dynamic nodesObj = obj["nodes"];
    if ((nodesObj != null) && nodesObj is List) {
      for (final node in nodesObj) {
        prettyPrintTree(node, indent + 1);
      }
    }

    dynamic floatingNodesObj = obj["floating_nodes"];
    if ((floatingNodesObj != null) && floatingNodesObj is List) {
      for (final node in floatingNodesObj) {
        prettyPrintTree(node, indent + 1);
      }
    }
  }

  static prettyPrint(int type, dynamic resp) {
    switch (type) {
      case IPCPayloadType.ipcSendTick:
        return;

      case IPCPayloadType.ipcGetVersion:
        prettyPrintVersion(resp);
        return;

      case IPCPayloadType.ipcGetConfig:
        prettyPrintConfig(resp);
        return;

      case IPCPayloadType.ipcGetTree:
        prettyPrintTree(resp, 0);
        return;

      case IPCPayloadType.ipcCommand:
      case IPCPayloadType.ipcGetWorkspaces:
      case IPCPayloadType.ipcGetInputs:
      case IPCPayloadType.ipcGetOutputs:
      case IPCPayloadType.ipcGetSeats:
        break;

      default:
        stdout.writeln(jsonEncode(resp));
        return;
    }

    if (resp is List) {
      for (final obj in resp) {
        switch (type) {
          case IPCPayloadType.ipcCommand:
            prettyPrintCmd(obj);
            break;

          case IPCPayloadType.ipcGetWorkspaces:
            prettyPrintWorkspace(obj);
            break;

          case IPCPayloadType.ipcGetInputs:
            prettyPrintInput(obj);
            break;

          case IPCPayloadType.ipcGetOutputs:
            prettyPrintOutput(obj);
            break;

          case IPCPayloadType.ipcGetSeats:
            prettyPrintSeat(obj);
            break;
        }
      }
    }
  }
}
