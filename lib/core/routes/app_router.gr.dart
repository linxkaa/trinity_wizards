// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart' as _i5;
import 'package:trinity_wizards/presentation/edit_contact_page.dart' as _i2;
import 'package:trinity_wizards/presentation/main_page.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    EditContactRoute.name: (routeData) {
      final args = routeData.argsAs<EditContactRouteArgs>(
          orElse: () => const EditContactRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EditContactPage(
          key: args.key,
          entity: args.entity,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditContactPage]
class EditContactRoute extends _i3.PageRouteInfo<EditContactRouteArgs> {
  EditContactRoute({
    _i4.Key? key,
    _i5.ContactEntity? entity,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          EditContactRoute.name,
          args: EditContactRouteArgs(
            key: key,
            entity: entity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditContactRoute';

  static const _i3.PageInfo<EditContactRouteArgs> page =
      _i3.PageInfo<EditContactRouteArgs>(name);
}

class EditContactRouteArgs {
  const EditContactRouteArgs({
    this.key,
    this.entity,
  });

  final _i4.Key? key;

  final _i5.ContactEntity? entity;

  @override
  String toString() {
    return 'EditContactRouteArgs{key: $key, entity: $entity}';
  }
}
