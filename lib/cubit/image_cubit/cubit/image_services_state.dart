part of 'image_services_cubit.dart';

@immutable
sealed class ImageServicesState {}

final class ImageServicesInitial extends ImageServicesState {}

final class ImageServicessuccess extends ImageServicesState {
  final String url;

  ImageServicessuccess({required this.url});
}

final class ImageServicesfailure extends ImageServicesState {}
