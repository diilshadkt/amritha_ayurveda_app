import 'package:amrita_ayurvedic_app/features/home/domain/entity/branch_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';

final class GetBranchesUsecase {
  final ApiRepository repository;
  GetBranchesUsecase({required this.repository});

  Future<List<BranchEntity>> call() async {
    try {
      return await repository.getBranches();
    } catch (e) {
      throw Exception('Error');
    }
  }
}
