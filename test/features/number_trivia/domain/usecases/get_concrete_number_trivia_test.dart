import 'package:dartz/dartz.dart'; // for Right
import 'package:tdd_clean_archi/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_clean_archi/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart'; // for Mocking
import 'package:flutter_test/flutter_test.dart'; // for setup
import 'package:tdd_clean_archi/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/annotations.dart';

// @GenerateMocks([NumberTriviaRepository])     // optional

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: 1, text: "test");

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result = await usecase.execute(number: tNumber);
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));  // verify if they have same return values  - extra layer of protection
      verifyNoMoreInteractions(mockNumberTriviaRepository); // ensure that usecase should not do anything more once execute
    },
  );
}
