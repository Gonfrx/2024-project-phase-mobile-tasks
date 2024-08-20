import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  EcommerceBloc() : super(EcommerceInitial()) {
    on<EcommerceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
