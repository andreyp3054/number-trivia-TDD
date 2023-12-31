import 'package:dartz/dartz.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failures.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure,NumberTrivia>?> execute({required int number}) async{
    return await repository.getConcreteNumberTrivia(number);
  }
}