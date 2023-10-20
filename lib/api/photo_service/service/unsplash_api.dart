import 'package:dio/dio.dart';
import 'package:photostock/api/photo_service/photo_service.dart';
import 'package:retrofit/retrofit.dart';

part 'unsplash_api.g.dart';

/// Api for getting photos from Unsplash.
@RestApi()
abstract class UnsplashApi {
  /// Factory constructor.
  factory UnsplashApi(Dio dio, {String baseUrl}) = _UnsplashApi;

  /// Get method for loading photos.
  @GET('/photos')
  Future<List<PhotoResponseDTO>> getPhotos({
    @Query('client_id') required String clientId,
    @Query('per_page') int itemsPerPage = 10,
    @Query('page') int page = 1,
  });
}
