import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:factory_api/features/api/api_exception.dart';
import 'package:factory_api/features/api_bloc/models/message_model.dart';
import 'package:factory_api/features/api_bloc/models/response_model.dart';

part 'api_event.dart';
part 'api_state.dart';

final dio = Dio();

class ApiBloc extends Bloc<ApiBlocEvent, ApiBlocState> {
  ApiBloc() : super(ApiInitialState()) {
    on<AuthRequestEvent>(decodeResponse);
  }

  FutureOr<void> decodeResponse(
      AuthRequestEvent event, Emitter<ApiBlocState> emit) async {
    
    emit(ApiLoadingState());

    try {
      final response = await dio.post('https://auth.jobhub.ru/api/v1/login',
          data: {'email': 'test@jobhub.ru', 'password': '123123'});

      if (response.statusCode == 200 && !response.data['error']) {
        final ResponseModel decodedResponseModel = ResponseModel.fromJson(response.data);

        emit(ApiLoadedState(data: [decodedResponseModel])); // state changes if u check with print, however ui (responses_list.dart) is not updated
      }
    } on DioException catch (e) {
      ApiException exception = ApiException();

      emit(ApiErrorState(errorMessage: exception.getExceptionMessage(e)[0]));
    }
  }
}
