// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_detail_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GetMovieDetailCommand)
const getMovieDetailCommandProvider = GetMovieDetailCommandProvider._();

final class GetMovieDetailCommandProvider
    extends $NotifierProvider<GetMovieDetailCommand, AsyncValue<MovieDetail?>> {
  const GetMovieDetailCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieDetailCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailCommandHash();

  @$internal
  @override
  GetMovieDetailCommand create() => GetMovieDetailCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<MovieDetail?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<MovieDetail?>>(value),
    );
  }
}

String _$getMovieDetailCommandHash() =>
    r'6e48e986bf5b5bee002568cdfc43691340e13a52';

abstract class _$GetMovieDetailCommand
    extends $Notifier<AsyncValue<MovieDetail?>> {
  AsyncValue<MovieDetail?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieDetail?>, AsyncValue<MovieDetail?>>,
              AsyncValue<MovieDetail?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
