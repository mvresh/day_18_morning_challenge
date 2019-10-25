import "package:test/test.dart";
import 'main.dart';

void main() {
  test("challenge 2 test 1", () {
    expect(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."), equals([["See", "Spot"], []]));
  });

  test("challenge 2 test 2", () {
    expect(noStrangers("See Spot run. see Spot jump. Spot likes jumping. See Spot fly."), equals([["Spot"], []]));
  });

  test("challenge 2 test 3", () {
    expect(noStrangers(". . . . ."), equals([[], []]));
  });

  test("challenge 2 test 4", () {
    expect(noStrangers(""), equals([[], []]));
  });

  test("challenge 2 test 5", () {
    expect(noStrangers("See, See, See, See"), equals([['See'], []]));
  });


  test("challenge 3 test 1", () {
    expect(doesRhyme("Sam I am!", "Green eggs and ham."), equals(true));
  });

  test("challenge 4 test 1", () {
    expect(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]), equals(true));
  });
}