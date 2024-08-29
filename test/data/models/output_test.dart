import 'package:i3_ipc/data/models/output.dart';
import 'package:test/test.dart';

import '../../core/test.dart';

class _MockMode extends MockMode {
  @override
  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['width'] = 1;
    data['height'] = 2;
    data['refresh'] = 3;
    data['picture_aspect_ratio'] = 'modePictureAspectRatio_test';
    return data;
  }
}

class _MockRect extends MockRect {
  @override
  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['x'] = 0;
    data['y'] = 1;
    data['width'] = 2;
    data['height'] = 3;
    return data;
  }
}

void main() {
  group('Output model', () {
    test('props are correct', () {
      final rectMock = _MockRect();
      final currentModeMock = _MockMode();
      final modesMock = [_MockMode()];
      final output = Output(
        id: 0,
        name: 'name_test',
        make: 'make_test',
        model: 'model_test',
        serial: 'serial_test',
        active: true,
        power: true,
        primary: true,
        scale: 1,
        subpixelHinting: 'subpixelHinting_test',
        transform: 'transform_test',
        modes: modesMock,
        currentMode: currentModeMock,
        rect: rectMock,
      );
      expect(
        output.props,
        equals([0]),
      );
    });

    group('serialize', () {
      test('with required parameters only', () {
        final rectMock = _MockRect();
        final currentModeMock = _MockMode();
        final modesMock = [_MockMode()];
        final output = Output(
          id: 0,
          name: 'name_test',
          make: 'make_test',
          model: 'model_test',
          serial: 'serial_test',
          active: true,
          power: true,
          primary: true,
          scale: 1,
          subpixelHinting: 'subpixelHinting_test',
          transform: 'transform_test',
          modes: modesMock,
          currentMode: currentModeMock,
          rect: rectMock,
        );
        final json = output.toJson();
        final id = json['id'];
        final name = json['name'];
        final make = json['make'];
        final model = json['model'];
        final serial = json['serial'];
        final active = json['active'];
        final power = json['power'];
        final primary = json['primary'];
        final scale = json['scale'];
        final subpixelHinting = json['subpixel_hinting'];
        final transform = json['transform'];
        final modes = json['modes'];
        final currentMode = json['current_mode'];
        final rect = json['rect'];
        final dpms = json['dpms'];
        final currentWorkspace = json['current_workspace'];
        final nonDesktop = json['non_desktop'];
        final focused = json['focused'];
        final scaleFilter = json['scale_filter'];
        final maxRenderTime = json['max_render_time'];
        final adaptiveSyncStatus = json['adaptive_sync_status'];

        expect(
          id,
          0,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          make,
          'make_test',
        );
        expect(
          model,
          'model_test',
        );
        expect(
          serial,
          'serial_test',
        );
        expect(
          active,
          true,
        );
        expect(
          power,
          true,
        );
        expect(
          primary,
          true,
        );
        expect(
          scale,
          1,
        );
        expect(
          subpixelHinting,
          'subpixelHinting_test',
        );
        expect(
          transform,
          'transform_test',
        );
        expect(
          modes,
          modesMock.map((e) => e.toJson()),
        );
        expect(
          currentMode,
          currentModeMock.toJson(),
        );
        expect(
          rect,
          rectMock.toJson(),
        );
        expect(
          dpms,
          null,
        );
        expect(
          currentWorkspace,
          null,
        );
        expect(
          nonDesktop,
          null,
        );
        expect(
          focused,
          null,
        );
        expect(
          scaleFilter,
          null,
        );
        expect(
          maxRenderTime,
          null,
        );
        expect(
          adaptiveSyncStatus,
          null,
        );
      });

      test('with all parameters', () {
        final rectMock = _MockRect();
        final currentModeMock = _MockMode();
        final modesMock = [_MockMode()];
        final output = Output(
          id: 0,
          name: 'name_test',
          make: 'make_test',
          model: 'model_test',
          serial: 'serial_test',
          active: true,
          power: true,
          primary: true,
          scale: 1,
          subpixelHinting: 'subpixelHinting_test',
          transform: 'transform_test',
          modes: modesMock,
          currentMode: currentModeMock,
          rect: rectMock,
          dpms: true,
          currentWorkspace: 'currentWorkspace_test',
          nonDesktop: false,
          focused: true,
          scaleFilter: 'scaleFilter_test',
          maxRenderTime: 0,
          adaptiveSyncStatus: 'adaptiveSyncStatus_test',
        );
        final json = output.toJson();
        final id = json['id'];
        final name = json['name'];
        final make = json['make'];
        final model = json['model'];
        final serial = json['serial'];
        final active = json['active'];
        final power = json['power'];
        final primary = json['primary'];
        final scale = json['scale'];
        final subpixelHinting = json['subpixel_hinting'];
        final transform = json['transform'];
        final modes = json['modes'];
        final currentMode = json['current_mode'];
        final rect = json['rect'];
        final dpms = json['dpms'];
        final currentWorkspace = json['current_workspace'];
        final nonDesktop = json['non_desktop'];
        final focused = json['focused'];
        final scaleFilter = json['scale_filter'];
        final maxRenderTime = json['max_render_time'];
        final adaptiveSyncStatus = json['adaptive_sync_status'];

        expect(
          id,
          0,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          make,
          'make_test',
        );
        expect(
          model,
          'model_test',
        );
        expect(
          serial,
          'serial_test',
        );
        expect(
          active,
          true,
        );
        expect(
          power,
          true,
        );
        expect(
          primary,
          true,
        );
        expect(
          scale,
          1,
        );
        expect(
          subpixelHinting,
          'subpixelHinting_test',
        );
        expect(
          transform,
          'transform_test',
        );
        expect(
          modes,
          modesMock.map((e) => e.toJson()),
        );
        expect(
          currentMode,
          currentModeMock.toJson(),
        );
        expect(
          rect,
          rectMock.toJson(),
        );
        expect(
          dpms,
          true,
        );
        expect(
          currentWorkspace,
          'currentWorkspace_test',
        );
        expect(
          nonDesktop,
          false,
        );
        expect(
          focused,
          true,
        );
        expect(
          scaleFilter,
          'scaleFilter_test',
        );
        expect(
          maxRenderTime,
          0,
        );
        expect(
          adaptiveSyncStatus,
          'adaptiveSyncStatus_test',
        );
      });
    });

    group('deserialize', () {
      final rectMock = _MockRect();
      final currentModeMock = _MockMode();
      final modesMock = [_MockMode()];
      test('with required parameters only', () {
        final json = {
          'id': 0,
          'name': 'name_test',
          'make': 'make_test',
          'model': 'model_test',
          'serial': 'serial_test',
          'active': true,
          'power': true,
          'primary': true,
          'scale': 1.0,
          'subpixel_hinting': 'subpixelHinting_test',
          'transform': 'transform_test',
          'modes': modesMock.map((e) => e.toJson()),
          'current_mode': currentModeMock.toJson(),
          'rect': rectMock.toJson(),
        };
        final output = Output.fromJson(json);
        expect(
          json,
          output.toJson(),
        );
        expect(
          output.id,
          0,
        );
        expect(
          output.name,
          'name_test',
        );
        expect(
          output.make,
          'make_test',
        );
        expect(
          output.model,
          'model_test',
        );
        expect(
          output.serial,
          'serial_test',
        );
        expect(
          output.active,
          true,
        );
        expect(
          output.power,
          true,
        );
        expect(
          output.primary,
          true,
        );
        expect(
          output.scale,
          1,
        );
        expect(
          output.subpixelHinting,
          'subpixelHinting_test',
        );
        expect(
          output.transform,
          'transform_test',
        );
        expect(
          output.modes.map((e) => e.toJson()),
          modesMock.map((e) => e.toJson()),
        );
        expect(
          output.currentMode.toJson(),
          currentModeMock.toJson(),
        );
        expect(
          output.rect.toJson(),
          rectMock.toJson(),
        );
        expect(
          output.dpms,
          null,
        );
        expect(
          output.currentWorkspace,
          null,
        );
        expect(
          output.nonDesktop,
          null,
        );
        expect(
          output.focused,
          null,
        );
        expect(
          output.scaleFilter,
          null,
        );
        expect(
          output.maxRenderTime,
          null,
        );
        expect(
          output.adaptiveSyncStatus,
          null,
        );
      });

      test('with all parameters', () {
        final json = {
          'id': 0,
          'name': 'name_test',
          'make': 'make_test',
          'model': 'model_test',
          'serial': 'serial_test',
          'active': true,
          'power': true,
          'primary': true,
          'scale': 1.0,
          'subpixel_hinting': 'subpixelHinting_test',
          'transform': 'transform_test',
          'modes': modesMock.map((e) => e.toJson()),
          'current_mode': currentModeMock.toJson(),
          'rect': rectMock.toJson(),
          'dpms': true,
          'current_workspace': 'currentWorkspace_test',
          'non_desktop': false,
          'focused': true,
          'scale_filter': 'scaleFilter_test',
          'max_render_time': 0,
          'adaptive_sync_status': 'adaptiveSyncStatus_test',
        };
        final output = Output.fromJson(json);
        expect(
          json,
          output.toJson(),
        );
        expect(
          output.id,
          0,
        );
        expect(
          output.name,
          'name_test',
        );
        expect(
          output.make,
          'make_test',
        );
        expect(
          output.model,
          'model_test',
        );
        expect(
          output.serial,
          'serial_test',
        );
        expect(
          output.active,
          true,
        );
        expect(
          output.power,
          true,
        );
        expect(
          output.primary,
          true,
        );
        expect(
          output.scale,
          1,
        );
        expect(
          output.subpixelHinting,
          'subpixelHinting_test',
        );
        expect(
          output.transform,
          'transform_test',
        );
        expect(
          output.modes.map((e) => e.toJson()),
          modesMock.map((e) => e.toJson()),
        );
        expect(
          output.currentMode.toJson(),
          currentModeMock.toJson(),
        );
        expect(
          output.rect.toJson(),
          rectMock.toJson(),
        );
        expect(
          output.dpms,
          true,
        );
        expect(
          output.currentWorkspace,
          'currentWorkspace_test',
        );
        expect(
          output.nonDesktop,
          false,
        );
        expect(
          output.focused,
          true,
        );
        expect(
          output.scaleFilter,
          'scaleFilter_test',
        );
        expect(
          output.maxRenderTime,
          0,
        );
        expect(
          output.adaptiveSyncStatus,
          'adaptiveSyncStatus_test',
        );
      });
    });
  });
}
