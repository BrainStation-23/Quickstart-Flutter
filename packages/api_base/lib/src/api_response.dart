part of api_base;

abstract class ApiResponse<TEntity> {
  const ApiResponse();

  TEntity toEntity();
}
