import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/fruits/fruits_model.dart';
import '../../../../data/repositories/fruits_repository.dart';
import 'fruits_states.dart';

class FruitsCubit extends Cubit<FruitsStates>{
  FruitsCubit() : super(InitialState()){
    getFruits();
  }

  static FruitsCubit get(context) => BlocProvider.of(context);

  List<FruitsModel> fruits = [];
  var fruitsRepository = FruitsRepository();


  void getFruits()async{
    try{
      emit(OnLoading());
      fruits = await fruitsRepository.getFruits();
      emit(OnSuccess());
    }catch(e){
      emit(OnError());
    }
  }
}