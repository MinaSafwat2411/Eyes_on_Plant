import 'package:eyes_on_plant/lib/data/models/vegetables/vegetables_model.dart';
import 'package:eyes_on_plant/lib/presentation/screens/vegetables/cubit/vegetables_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/vegetables_repository.dart';

class VegetablesCubit extends Cubit<VegetablesStates>{
  VegetablesCubit() : super(InitialState()){
    getVegetables();
  }

  static VegetablesCubit get(context) => BlocProvider.of(context);

  List<VegetablesModel> vegetables = [];
  var vegetablesRepository = VegetablesRepository();


  void getVegetables()async{
    try{
      emit(OnLoading());
      vegetables = await vegetablesRepository.getVegetables();
      emit(OnSuccess());
    }catch(e){
      print(e.toString());
      emit(OnError());
    }
  }
}