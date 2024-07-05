import 'package:amrita_ayurvedic_app/features/home/domain/entity/branch_entity.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/usecase/get_branches_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BranchProvider extends ChangeNotifier {
  Future<List<BranchEntity>> getBranch() async {
    return await GetBranchesUsecase(repository: GetIt.I.get<ApiRepository>())();
  }
}
