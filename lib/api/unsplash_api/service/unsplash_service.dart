import 'package:dio/dio.dart';
import 'package:photostock/api/base_urls.dart';
import 'package:photostock/api/unsplash_api/unsplash_api.dart';
import 'package:retrofit/retrofit.dart';

part 'unsplash_service.g.dart';

/// Service for getting photos from Unsplash.
@RestApi(baseUrl: BaseUrl.unsplashUrl)
abstract class UnsplashService {
  /// Factory constructor.
  factory UnsplashService(Dio dio, {String baseUrl}) = _UnsplashService;

  /// Get method for loading photos.
  @GET('/photos')
  Future<List<PhotoRM>> getPhotos({
    @Query('client_id') required String clientId,
    @Query('per_page') int itemsPerPage = 10,
    @Query('page') int page = 1,
  });
}
