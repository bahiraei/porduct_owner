import '../../../../core/client/http_client.dart';
import '../response/vesselles_model.dart';
import '../source/imass_data_source.dart';

abstract class IIMassRepository {
  Future<VessellesResponse> getVesselles({
    required String password,
  });
}

class IMassRepository implements IIMassRepository {
  final IIMassDataSource dataSource;

  IMassRepository({
    required this.dataSource,
  });

  @override
  Future<VessellesResponse> getVesselles({
    required String password,
  }) {
    return dataSource.getVesselles(
      password: password,
    );
  }
}

final iMassRepository = IMassRepository(
    dataSource: IIMassRemoteDataSource(
  http: loadUnloadClient,
));
