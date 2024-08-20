part of 'ecommerce_bloc.dart';

abstract class EcommerceState extends Equatable {
  const EcommerceState();  

  @override
  List<Object> get props => [];
}
class EcommerceInitial extends EcommerceState {}
