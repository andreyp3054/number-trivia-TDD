import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean_archi/core/error/failures.dart';
import 'package:tdd_clean_archi/core/usecases/usecase.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {    // randomNumbertrivia accepts no number parameter

  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams params) async {
  return await repository.getRandomNumberTrivia();
  }
}

