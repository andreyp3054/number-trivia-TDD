import 'package:dartz/dartz.dart'; // for Right
import 'package:tdd_clean_archi/core/usecases/usecase.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart'; // for Mocking
import 'package:flutter_test/flutter_test.dart'; // for setup
import 'package:tdd_clean_archi/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

// @GenerateMocks([NumberTriviaRepository])     // optional

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(
    () {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
    },
  );

  const tNumberTrivia = NumberTrivia(number: 1, text: "test");

  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result =
          await usecase(NoParams()); // or usecase.call(number: tNumber);
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository
          .getRandomNumberTrivia()); // verify if they have same return values  - extra layer of protection
      verifyNoMoreInteractions(
          mockNumberTriviaRepository); // ensure that usecase should not do anything more once execute
    },
  );
}
