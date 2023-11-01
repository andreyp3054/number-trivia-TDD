import 'package:dartz/dartz.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/error/failures.dart';

abstract class NumberTriviaRepository{
    // 2 methods for getting
  // Either<L,R> - L (always for failure)
 Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number);
 Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia();
}
