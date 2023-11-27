import 'package:dio/dio.dart';
import 'package:photostock/api/photo_api/data/photo_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api.g.dart';

/// [PhotoApi] for getting photos from unsplash.com.
@RestApi()
abstract class PhotoApi {
  /// Create an instance of [PhotoApi].
  factory PhotoApi(Dio dio, {String baseUrl}) = _PhotoApi;

  /// Get photos from unsplash.com.
  @GET('/photos')
  Future<List<PhotoResponseDTO>> getPhotos({
    @Query('client_id') required String clientId,
    @Query('per_page') int itemsPerPage = 10,
    @Query('page') int pageKey = 1,
  });
}
