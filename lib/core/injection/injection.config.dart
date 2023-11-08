// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:trinity_wizards/application/main_contact_cubit/main_contact_cubit.dart'
    as _i9;
import 'package:trinity_wizards/core/env/env.dart' as _i4;
import 'package:trinity_wizards/core/routes/app_router.dart' as _i3;
import 'package:trinity_wizards/core/utils/register_module.dart' as _i11;
import 'package:trinity_wizards/domain/home/i_home_repository.dart' as _i6;
import 'package:trinity_wizards/infrastructure/data_source/home_data_sources.dart'
    as _i5;
import 'package:trinity_wizards/infrastructure/repository/home_repository.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.appRouter);
    gh.factory<_i4.Env>(() => _i4.Env());
    gh.factory<_i5.HomeDataSource>(() => _i5.HomeDataSource());
    gh.lazySingleton<_i6.IHomeRepository>(
        () => _i7.HomeRepository(gh<_i5.HomeDataSource>()));
    gh.lazySingleton<_i8.Logger>(() => registerModule.logger);
    gh.factory<_i9.MainContactCubit>(
        () => _i9.MainContactCubit(gh<_i6.IHomeRepository>()));
    gh.lazySingleton<_i10.Dio>(() => registerModule.dio(gh<_i4.Env>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
