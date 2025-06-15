import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:propedia/models/dtos/stores/properties_dto.dart';
import 'package:propedia/models/request/stores/property_request.dart';
import 'package:propedia/presentation/core/constant/api_constant.dart';

part 'properties_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PropertiesApiService {
  factory PropertiesApiService(Dio dio, {String baseUrl}) = _PropertiesApiService;

  @POST('/api/{role}/properties')
  Future<CreatePropertyResponseDto> createProperty(
    @Path('role') String role,
    @Body() CreatePropertyRequest request,
    @Header('Authorization') String token,
  );

  @GET('/api/property-types')
  Future<PropertyTypeResponseDto> getPropertyTypes(
    @Header('Authorization') String token,
  );

  @GET('/api/{role}/properties')
  Future<List<PropertyDto>> getMyProperties(
    @Path('role') String role,
    @Header('Authorization') String token,
  );

  @GET('/api/{role}/properties/property/{propertyId}')
  Future<PropertyDto> getPropertyDetail(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
    @Header('Authorization') String token,
  );

  @PATCH('/api/{role}/properties/property/{propertyId}')
  Future<PropertyDto> updateProperty(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
    @Body() UpdatePropertyRequest request,
    @Header('Authorization') String token,
  );

  @DELETE('/api/{role}/properties/property/{propertyId}')
  Future<void> deleteProperty(
    @Path('role') String role,
    @Path('propertyId') String propertyId,
    @Header('Authorization') String token,
  );

  @GET('/api/pembeli/properties')
  Future<List<PropertyDto>> getBuyerProperties(
    @Header('Authorization') String token,
  );

  @GET('/api/pembeli/properties/property/{propertyId}')
  Future<PropertyDto> getBuyerPropertyDetail(
    @Path('propertyId') String propertyId,
  );

  /// ✅ NEW: Filter properti berdasarkan lokasi (bebas query kombinasi)
  @GET('/api/lokasi/properties')
  Future<List<PropertyDto>> getPropertiesByLocation({
    @Query('provinsi') String? provinsi,
    @Query('kabupaten') String? kabupaten,
    @Query('kecamatan') String? kecamatan,
    @Query('kelurahan') String? kelurahan,
    @Header('Authorization') required String token,
  });
}
