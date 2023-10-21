import 'package:dio/dio.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api.g.dart';

/// Api for getting photos from Photo.
@RestApi()
abstract class PhotoApi {
  /// Factory constructor.
  factory PhotoApi(Dio dio, {String baseUrl}) = _PhotoApi;

  /// Get method for loading photos.
  @GET('/photos')
  Future<List<PhotoResponseDTO>> getPhotos({
    @Query('client_id') required String clientId,
    @Query('per_page') int itemsPerPage = 10,
    @Query('page') int page = 1,
  });
}