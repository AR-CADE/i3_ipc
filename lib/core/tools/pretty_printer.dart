import 'dart:convert';
import 'dart:io';

import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/config.dart';
import 'package:i3_ipc/data/models/input.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/node.dart';
import 'package:i3_ipc/data/models/output.dart';
import 'package:i3_ipc/data/models/seat.dart';
import 'package:i3_ipc/data/models/status.dart';
import 'package:i3_ipc/data/models/version.dart';
import 'package:i3_ipc/data/models/workspace.dart';

class PrettyPrinter {
  static String rawPretty(Object? object) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(object);
  }

  static void prettyPrintCmd(Status s) {
    if (s.success == false) {
      final error = s.error;

      if (error == null) {
        stdout.write('An unknkown error occurred');
      } else {
        stdout.write('Error: $error\n');
      }
    }
  }

  static void prettyPrintWorkspace(Workspace w) {
    final name = w.name;
    // final rect = w.rect;
    final visible = w.visible;
    final output = w.output;
    final urgent = w.urgent;
    final layout = w.layout;
    final representation = w.representation;
    final focused = w.focused;

    stdout.write(
        // ignore: lines_longer_than_80_chars
        "Workspace $name${focused ? " (focused)" : ""}${!visible ? " (off-screen)" : ""}${urgent ? " (urgent)" : ""}\n"
        '  Output: $output\n'
        '  Layout: $layout\n'
        '  Representation: $representation\n\n');
  }

  static String prettyTypeName(String name) {
    // TODO(common): these constants probably belong in a common lib
    final typeNames = <String, String>{
      'keyboard': 'Keyboard',
      'pointer': 'Mouse',
      'touchpad': 'Touchpad',
      'tablet_pad': 'Tablet pad',
      'tablet_tool': 'Tablet tool',
      'touch': 'Touch',
      'switch': 'Switch',
    };

    final pretty = typeNames[name];

    if (pretty != null) {
      return pretty;
    }

    return name;
  }

  static void prettyPrintInput(Input i) {
    final id = i.identifier;
    final name = i.name;
    final type = i.type;
    final product = i.product;
    final vendor = i.vendor;

    final fmt = 'Input device: $name\n'
        '  Type: ${prettyTypeName(type)}\n'
        '  Identifier: $id\n'
        '  Product ID: $product\n'
        '  Vendor ID: $vendor\n';

    stdout.write(fmt);

    final kbdlayout = i.xkbActiveLayoutName;
    if (kbdlayout != null) {
      stdout.write('  Active Keyboard Layout: '
          '${kbdlayout.isNotEmpty ? kbdlayout : '(unnamed)'}\n');
    }

    final libinput = i.libinput;
    if (libinput != null) {
      final events = libinput.sendEvents;
      stdout.write('  Libinput Send Events: $events\n');
    }

    stdout.write('\n');
  }

  static void prettyPrintSeat(Seat s) {
    final name = s.name;
    final capabilities = s.capabilities;
    final devices = s.devices;

    final fmt = 'Seat: $name\n'
        '  Capabilities: $capabilities\n';

    stdout.write(fmt);

    if (devices.isNotEmpty) {
      stdout.write('  Devices:\n');
      for (final device in devices) {
        final deviceName = device.name;
        stdout.write('    $deviceName\n');
      }
    }

    stdout.write('\n');
  }

  static void prettyPrintOutput(Output o) {
    final name = o.name;
    final make = o.make;
    final model = o.model;
    final serial = o.serial;
    final rect = o.rect;
    final focused = o.focused ?? false;

    final active = o.active;
    final power = o.power;
    final ws = o.currentWorkspace;
    final nonDesktop = o.nonDesktop;

    final scale = o.scale;
    final scaleFilter = o.scaleFilter;
    final subpixel = o.subpixelHinting;
    final transform = o.transform;
    final maxRenderTime = o.maxRenderTime;
    final adaptiveSyncStatus = o.adaptiveSyncStatus;

    final x = rect.x;
    final y = rect.y;

    final modes = o.modes;
    final currentMode = o.currentMode;

    final width = currentMode.width;
    final height = currentMode.height;
    final refresh = currentMode.refresh;

    if (nonDesktop != null && nonDesktop == true) {
      stdout.write("Output $name '$make $model $serial' (non-desktop)\n");
    } else if (active == true) {
      stdout
        ..write("Output $name '$make $model $serial'"
            "${focused ? " (focused)" : ""}\n"
            '  Current mode: ${width}x$height @ ${refresh / 1000} Hz\n'
            "  Power: ${power ? "on" : "off"}\n"
            '  Position: $x,$y\n'
            '  Scale factor: $scale\n'
            '  Scale filter: $scaleFilter\n'
            '  Subpixel hinting: $subpixel\n'
            '  Transform: $transform\n'
            '  Workspace: $ws\n')
        ..write('  Max render time: ')
        ..write(maxRenderTime == 0 ? 'off\n' : '$maxRenderTime ms\n')
        ..write('  Adaptive sync: $adaptiveSyncStatus\n');
    } else {
      stdout.write("Output $name '$make $model $serial' (disabled)\n");
    }

    if (modes.isNotEmpty) {
      stdout.write('  Available modes:\n');
      for (final mode in modes) {
        final modeWidth = mode.width;
        final modeHeight = mode.height;
        final modeRefresh = mode.refresh;
        final modePictureAspectRatio = mode.modePictureAspectRatio;

        stdout.write('    ${modeWidth}x$modeHeight @ ${modeRefresh / 1000} Hz');

        if (modePictureAspectRatio != null &&
            modePictureAspectRatio != 'none') {
          stdout.write(' ($modePictureAspectRatio)');
        }

        stdout.write('\n');
      }
    }

    stdout.write('\n');
  }

  static void prettyPrintVersion(Version v) {
    final ver = v.humanReadable;
    final variant = v.variant;
    stdout.write('$variant version $ver\n');
  }

  static void prettyPrintConfig(Config c) {
    final config = c.config;
    stdout.write('$config\n');
  }

  static void prettyPrintTree(Node n, int indent) {
    for (var i = 0; i < indent; i++) {
      stdout.write('  ');
    }

    final id = n.id;
    final name = n.name;
    final type = n.type;
    final shell = n.shell;

    stdout.write('#$id: $type "$name"');

    if (shell != null) {
      final pid = n.pid;
      final appId = n.appId;
      final windowPropsObj = n.windowProperties;

      final instance = windowPropsObj?.instance;
      final clazz = windowPropsObj?.clazz;

      final x11Id = n.window;

      stdout.write(' ($shell, pid: $pid');
      if (appId != null) {
        stdout.write(', app_id: "$appId"');
      }

      if (instance != null) {
        stdout.write(', instance: "$instance"');
      }

      if (clazz != null) {
        stdout.write(', class: "$clazz"');
      }

      if (x11Id != null) {
        if (x11Id != 0) {
          stdout.write(', X11 window: 0x${x11Id.toRadixString(16)}');
        }
      }

      stdout.write(')');
    }

    stdout.write('\n');

    final nodesObj = n.nodes;
    for (final node in nodesObj) {
      prettyPrintTree(node, indent + 1);
    }

    final floatingNodesObj = n.floatingNodes;
    if (floatingNodesObj != null) {
      for (final node in floatingNodesObj) {
        prettyPrintTree(node, indent + 1);
      }
    }
  }

  static void prettyPrint(int type, IPCResponse response) {
    final payload = response.payload;
    if (payload == null) {
      return;
    }
    final json = jsonDecode(payload);
    switch (type) {
      case IpcPayloadType.ipcSendTick:
        return;

      case IpcPayloadType.ipcGetVersion:
        prettyPrintVersion(Version.fromJson(json as Map<String, Object?>));
        return;

      case IpcPayloadType.ipcGetConfig:
        prettyPrintConfig(Config.fromJson(json as Map<String, Object?>));
        return;

      case IpcPayloadType.ipcGetTree:
        prettyPrintTree(Node.fromJson(json as Map<String, Object?>), 0);
        return;

      case IpcPayloadType.ipcCommand:
      case IpcPayloadType.ipcGetWorkspaces:
      case IpcPayloadType.ipcGetInputs:
      case IpcPayloadType.ipcGetOutputs:
      case IpcPayloadType.ipcGetSeats:
        break;

      default:
        stdout.writeln(rawPretty(json));
        return;
    }

    if (json is Iterable) {
      for (final obj in json) {
        switch (type) {
          case IpcPayloadType.ipcCommand:
            prettyPrintCmd(Status.fromJson(obj as Map<String, Object?>));

          case IpcPayloadType.ipcGetWorkspaces:
            prettyPrintWorkspace(
              Workspace.fromJson(obj as Map<String, Object?>),
            );

          case IpcPayloadType.ipcGetInputs:
            prettyPrintInput(Input.fromJson(obj as Map<String, Object?>));

          case IpcPayloadType.ipcGetOutputs:
            prettyPrintOutput(Output.fromJson(obj as Map<String, Object?>));

          case IpcPayloadType.ipcGetSeats:
            prettyPrintSeat(Seat.fromJson(obj as Map<String, Object?>));
        }
      }
    }
  }
}
