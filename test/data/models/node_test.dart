import 'package:i3_ipc/data/models/node.dart';
import 'package:test/test.dart';

import '../../core/test.dart';

class _MockWindowProperties extends MockWindowProperties {
  @override
  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['class'] = 'class_test';
    data['instance'] = 'instance_test';
    data['title'] = 'title_test';
    data['transient_for'] = 'transientFor_test';
    return data;
  }
}

class _MockIdleInhibitor extends MockIdleInhibitor {
  @override
  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['application'] = 'application_test';
    data['user'] = 'user_test';
    return data;
  }
}

class _MockRect extends MockRect {
  @override
  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['x'] = 0;
    data['y'] = 1;
    data['width'] = 2;
    data['height'] = 3;
    return data;
  }
}

class _MockNode extends MockNode {
  @override
  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    final rect = _MockRect();
    final windowRect = _MockRect();
    final decoRect = _MockRect();
    final geometry = _MockRect();
    data['id'] = 0;
    data['name'] = 'name';
    data['type'] = 'type';
    data['border'] = 'border';
    data['current_border_width'] = 1;
    data['layout'] = 'layout';
    data['orientation'] = 'orientation';
    data['rect'] = rect.toJSON();
    data['window_rect'] = windowRect.toJSON();
    data['deco_rect'] = decoRect.toJSON();
    data['geometry'] = geometry.toJSON();
    data['urgent'] = false;
    data['sticky'] = false;
    data['marks'] = ['1', '2'];
    data['focused'] = true;
    data['focus'] = [1, 2, 3];
    data['nodes'] = <Map<String, dynamic>>[];
    data['percent'] = 2.0;
    data['floating_nodes'] = <Map<String, dynamic>>[];
    data['representation'] = 'representation';
    data['fullscreen_mode'] = 3;
    data['app_id'] = 'appId';
    data['pid'] = 321;
    data['visible'] = true;
    data['shell'] = 'shell';
    data['inhibit_idle'] = false;
    data['idle_inhibitors'] = null;
    data['window'] = 4;
    data['window_properties'] = null;
    return data;
  }
}

void main() {
  group('Node model', () {
    test('props are correct', () {
      const marksMock = ['1', '2'];
      const focusMock = [1, 2, 3, 4];
      final rectMock = _MockRect();
      final windowRectMock = _MockRect();
      final decoRectMock = _MockRect();
      final geometryMock = _MockRect();
      final nodesMock = [_MockNode()];

      final mode = Node(
        id: 0,
        name: 'name_test',
        type: 'type_test',
        border: 'border_test',
        currentBorderWidth: 1,
        layout: 'layout_test',
        orientation: 'orientation_test',
        rect: rectMock,
        windowRect: windowRectMock,
        decoRect: decoRectMock,
        geometry: geometryMock,
        urgent: false,
        sticky: false,
        marks: marksMock,
        focused: true,
        focus: focusMock,
        nodes: nodesMock,
      );
      expect(
        mode.props,
        equals([0]),
      );
    });

    group('serialize', () {
      test('with required parameters only', () {
        const marksMock = ['1', '2'];
        const focusMock = [1, 2, 3, 4];
        final rectMock = _MockRect();
        final windowRectMock = _MockRect();
        final decoRectMock = _MockRect();
        final geometryMock = _MockRect();
        final nodesMock = [_MockNode()];

        final mode = Node(
          id: 0,
          name: 'name_test',
          type: 'type_test',
          border: 'border_test',
          currentBorderWidth: 1,
          layout: 'layout_test',
          orientation: 'orientation_test',
          rect: rectMock,
          windowRect: windowRectMock,
          decoRect: decoRectMock,
          geometry: geometryMock,
          urgent: false,
          sticky: false,
          marks: marksMock,
          focused: true,
          focus: focusMock,
          nodes: nodesMock,
        );
        final json = mode.toJSON();
        final id = json['id'];
        final name = json['name'];
        final type = json['type'];
        final border = json['border'];
        final currentBorderWidth = json['current_border_width'];
        final layout = json['layout'];
        final orientation = json['orientation'];
        final rect = json['rect'];
        final windowRect = json['window_rect'];
        final decoRect = json['deco_rect'];
        final geometry = json['geometry'];
        final urgent = json['urgent'];
        final sticky = json['sticky'];
        final marks = json['marks'];
        final focused = json['focused'];
        final focus = json['focus'];
        final nodes = json['nodes'];
        final floatingNodes = json['floating_nodes'];
        final percent = json['percent'];
        final representation = json['representation'];
        final fullscreenMode = json['fullscreen_mode'];
        final appId = json['app_id'];
        final pid = json['pid'];
        final visible = json['visible'];
        final shell = json['shell'];
        final inhibitIdle = json['inhibit_idle'];
        final idleInhibitors = json['idle_inhibitors'];
        final window = json['window'];
        final windowProperties = json['window_properties'];

        expect(
          id,
          0,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          type,
          'type_test',
        );
        expect(
          border,
          'border_test',
        );
        expect(
          currentBorderWidth,
          1,
        );
        expect(
          layout,
          'layout_test',
        );
        expect(
          orientation,
          'orientation_test',
        );
        expect(
          rect,
          rectMock.toJSON(),
        );
        expect(
          windowRect,
          windowRectMock.toJSON(),
        );
        expect(
          decoRect,
          decoRectMock.toJSON(),
        );
        expect(
          geometry,
          geometryMock.toJSON(),
        );
        expect(
          urgent,
          false,
        );
        expect(
          sticky,
          false,
        );
        expect(
          marks,
          marksMock,
        );
        expect(
          focused,
          true,
        );
        expect(
          focus,
          focusMock,
        );
        expect(
          nodes,
          nodesMock.map((e) => e.toJSON()),
        );
        expect(
          floatingNodes,
          null,
        );
        expect(
          percent,
          null,
        );
        expect(
          representation,
          null,
        );
        expect(
          fullscreenMode,
          null,
        );
        expect(
          appId,
          null,
        );
        expect(
          pid,
          null,
        );
        expect(
          visible,
          null,
        );
        expect(
          shell,
          null,
        );
        expect(
          inhibitIdle,
          null,
        );
        expect(
          idleInhibitors,
          null,
        );
        expect(
          window,
          null,
        );
        expect(
          windowProperties,
          null,
        );
      });

      test('with all parameters', () {
        const marksMock = ['1', '2'];
        const focusMock = [1, 2, 3, 4];
        final rectMock = _MockRect();
        final windowRectMock = _MockRect();
        final decoRectMock = _MockRect();
        final geometryMock = _MockRect();
        final nodesMock = [_MockNode()];
        final floatingNodesMock = [_MockNode(), _MockNode()];
        final idleInhibitorsMock = _MockIdleInhibitor();
        final windowPropertiesMock = _MockWindowProperties();

        final mode = Node(
          id: 0,
          name: 'name_test',
          type: 'type_test',
          border: 'border_test',
          currentBorderWidth: 1,
          layout: 'layout_test',
          orientation: 'orientation_test',
          rect: rectMock,
          windowRect: windowRectMock,
          decoRect: decoRectMock,
          geometry: geometryMock,
          urgent: false,
          sticky: false,
          marks: marksMock,
          focused: true,
          focus: focusMock,
          nodes: nodesMock,
          floatingNodes: floatingNodesMock,
          percent: 2,
          representation: 'representation_test',
          fullscreenMode: 3,
          appId: 'appId_test',
          pid: 321,
          visible: true,
          shell: 'shell_test',
          inhibitIdle: false,
          idleInhibitors: idleInhibitorsMock,
          window: 4,
          windowProperties: windowPropertiesMock,
        );
        final json = mode.toJSON();
        final id = json['id'];
        final name = json['name'];
        final type = json['type'];
        final border = json['border'];
        final currentBorderWidth = json['current_border_width'];
        final layout = json['layout'];
        final orientation = json['orientation'];
        final rect = json['rect'];
        final windowRect = json['window_rect'];
        final decoRect = json['deco_rect'];
        final geometry = json['geometry'];
        final urgent = json['urgent'];
        final sticky = json['sticky'];
        final marks = json['marks'];
        final focused = json['focused'];
        final focus = json['focus'];
        final nodes = json['nodes'];
        final floatingNodes = json['floating_nodes'];
        final percent = json['percent'];
        final representation = json['representation'];
        final fullscreenMode = json['fullscreen_mode'];
        final appId = json['app_id'];
        final pid = json['pid'];
        final visible = json['visible'];
        final shell = json['shell'];
        final inhibitIdle = json['inhibit_idle'];
        final idleInhibitors = json['idle_inhibitors'];
        final window = json['window'];
        final windowProperties = json['window_properties'];

        expect(
          id,
          0,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          type,
          'type_test',
        );
        expect(
          border,
          'border_test',
        );
        expect(
          currentBorderWidth,
          1,
        );
        expect(
          layout,
          'layout_test',
        );
        expect(
          orientation,
          'orientation_test',
        );
        expect(
          rect,
          rectMock.toJSON(),
        );
        expect(
          windowRect,
          windowRectMock.toJSON(),
        );
        expect(
          decoRect,
          decoRectMock.toJSON(),
        );
        expect(
          geometry,
          geometryMock.toJSON(),
        );
        expect(
          urgent,
          false,
        );
        expect(
          sticky,
          false,
        );
        expect(
          marks,
          marksMock,
        );
        expect(
          focused,
          true,
        );
        expect(
          focus,
          focusMock,
        );
        expect(
          nodes,
          nodesMock.map((e) => e.toJSON()),
        );
        expect(
          floatingNodes,
          floatingNodesMock.map((e) => e.toJSON()),
        );
        expect(
          percent,
          2,
        );
        expect(
          representation,
          'representation_test',
        );
        expect(
          fullscreenMode,
          3,
        );
        expect(
          appId,
          'appId_test',
        );
        expect(
          pid,
          321,
        );
        expect(
          visible,
          true,
        );
        expect(
          shell,
          'shell_test',
        );
        expect(
          inhibitIdle,
          false,
        );
        expect(
          idleInhibitors,
          idleInhibitorsMock.toJSON(),
        );
        expect(
          window,
          4,
        );
        expect(
          windowProperties,
          windowPropertiesMock.toJSON(),
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        const marksMock = ['1', '2'];
        const focusMock = [1, 2, 3, 4];
        final rectMock = _MockRect();
        final windowRectMock = _MockRect();
        final decoRectMock = _MockRect();
        final geometryMock = _MockRect();

        final json = {
          'id': 0,
          'name': 'name_test',
          'type': 'type_test',
          'border': 'border_test',
          'current_border_width': 1,
          'layout': 'layout_test',
          'orientation': 'orientation_test',
          'rect': rectMock.toJSON(),
          'window_rect': windowRectMock.toJSON(),
          'deco_rect': decoRectMock.toJSON(),
          'geometry': geometryMock.toJSON(),
          'urgent': false,
          'sticky': false,
          'marks': marksMock,
          'focused': true,
          'focus': focusMock,
          'nodes': <Map<String, dynamic>>[],
        };
        final node = Node.fromJSON(json);

        expect(
          node.id,
          0,
        );
        expect(
          node.name,
          'name_test',
        );
        expect(
          node.type,
          'type_test',
        );
        expect(
          node.border,
          'border_test',
        );
        expect(
          node.currentBorderWidth,
          1,
        );
        expect(
          node.layout,
          'layout_test',
        );
        expect(
          node.orientation,
          'orientation_test',
        );
        expect(
          node.rect.toJSON(),
          rectMock.toJSON(),
        );
        expect(
          node.windowRect.toJSON(),
          windowRectMock.toJSON(),
        );
        expect(
          node.decoRect.toJSON(),
          decoRectMock.toJSON(),
        );
        expect(
          node.geometry.toJSON(),
          geometryMock.toJSON(),
        );
        expect(
          node.urgent,
          false,
        );
        expect(
          node.sticky,
          false,
        );
        expect(
          node.marks,
          marksMock,
        );
        expect(
          node.focused,
          true,
        );
        expect(
          node.focus,
          focusMock,
        );
        expect(
          node.nodes,
          <Node>[],
        );
        expect(
          node.floatingNodes,
          null,
        );
        expect(
          node.percent,
          null,
        );
        expect(
          node.representation,
          null,
        );
        expect(
          node.fullscreenMode,
          null,
        );
        expect(
          node.appId,
          null,
        );
        expect(
          node.pid,
          null,
        );
        expect(
          node.visible,
          null,
        );
        expect(
          node.shell,
          null,
        );
        expect(
          node.inhibitIdle,
          null,
        );
        expect(
          node.idleInhibitors,
          null,
        );
        expect(
          node.window,
          null,
        );
        expect(
          node.windowProperties,
          null,
        );
      });

      test('with all parameters', () {
        const marksMock = ['1', '2'];
        const focusMock = [1, 2, 3, 4];
        final rectMock = _MockRect();
        final windowRectMock = _MockRect();
        final decoRectMock = _MockRect();
        final geometryMock = _MockRect();
        final idleInhibitorsMock = _MockIdleInhibitor();
        final windowPropertiesMock = _MockWindowProperties();
        final nodes = [_MockNode()];
        final floatingNodes = [_MockNode(), _MockNode()];

        final json = {
          'id': 0,
          'name': 'name_test',
          'type': 'type_test',
          'border': 'border_test',
          'current_border_width': 1,
          'layout': 'layout_test',
          'orientation': 'orientation_test',
          'rect': rectMock.toJSON(),
          'window_rect': windowRectMock.toJSON(),
          'deco_rect': decoRectMock.toJSON(),
          'geometry': geometryMock.toJSON(),
          'urgent': false,
          'sticky': false,
          'marks': marksMock,
          'focused': true,
          'focus': focusMock,
          'nodes': nodes.map((e) => e.toJSON()),
          'floating_nodes': floatingNodes.map((e) => e.toJSON()),
          'percent': 2.0,
          'representation': 'representation_test',
          'fullscreen_mode': 3,
          'app_id': 'appId_test',
          'pid': 321,
          'visible': true,
          'shell': 'shell_test',
          'inhibit_idle': false,
          'idle_inhibitors': idleInhibitorsMock.toJSON(),
          'window': 4,
          'window_properties': windowPropertiesMock.toJSON(),
        };
        final node = Node.fromJSON(json);

        expect(
          node.id,
          0,
        );
        expect(
          node.name,
          'name_test',
        );
        expect(
          node.type,
          'type_test',
        );
        expect(
          node.border,
          'border_test',
        );
        expect(
          node.currentBorderWidth,
          1,
        );
        expect(
          node.layout,
          'layout_test',
        );
        expect(
          node.orientation,
          'orientation_test',
        );
        expect(
          node.rect.toJSON(),
          rectMock.toJSON(),
        );
        expect(
          node.windowRect.toJSON(),
          windowRectMock.toJSON(),
        );
        expect(
          node.decoRect.toJSON(),
          decoRectMock.toJSON(),
        );
        expect(
          node.geometry.toJSON(),
          geometryMock.toJSON(),
        );
        expect(
          node.urgent,
          false,
        );
        expect(
          node.sticky,
          false,
        );
        expect(
          node.marks,
          marksMock,
        );
        expect(
          node.focused,
          true,
        );
        expect(
          node.focus,
          focusMock,
        );
        expect(
          node.nodes.map((e) => e.toJSON()),
          nodes.map((e) => e.toJSON()),
        );
        expect(
          node.floatingNodes?.map((e) => e.toJSON()),
          floatingNodes.map((e) => e.toJSON()),
        );
        expect(
          node.percent,
          2.0,
        );
        expect(
          node.representation,
          'representation_test',
        );
        expect(
          node.fullscreenMode,
          3,
        );
        expect(
          node.appId,
          'appId_test',
        );
        expect(
          node.pid,
          321,
        );
        expect(
          node.visible,
          true,
        );
        expect(
          node.shell,
          'shell_test',
        );
        expect(
          node.inhibitIdle,
          false,
        );
        expect(
          node.idleInhibitors?.toJSON(),
          idleInhibitorsMock.toJSON(),
        );
        expect(
          node.window,
          4,
        );
        expect(
          node.windowProperties?.toJSON(),
          windowPropertiesMock.toJSON(),
        );
      });
    });
  });
}
