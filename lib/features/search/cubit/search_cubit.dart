import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../home/data/models/product_model.dart';
import '../data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String name) async {
    emit(SearchLoading());
    try {
      final response = await SearchRepo.search(name);
      if (response is ProductsResponse) {
        emit(SearchSuccess(response.data!.products!));
      } else {
        emit(SearchError());
      }
    } catch (e) {
      emit(SearchError());
    }
  }
}
