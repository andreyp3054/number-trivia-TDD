import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean_archi/core/usecases/usecase.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failures.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params>{
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);   //accepts an argument: repository

  // overrides the call method from usecase
  @override
  Future<Either<Failure,NumberTrivia>?> call(Params params) async{
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

//data holder class for all the parameters
class Params extends Equatable {
  final int number;
  const Params({required this.number});


  // required override action for equatable
  @override
  // TODO: implement props
  List<Object?> get props => [number];
}