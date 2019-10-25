// Challenge 1
// Write test cases for next 2 challenges. Also include tests for boundary conditions
// For this challenge, the input will be a (long) string.
import "dart:collection";
// Challenge 2
// A word encountered for the first time is a stranger.
// A word encountered thrice becomes an acquaintance.
// A word encountered 5 times becomes a friend.

// Create a function that takes the string and returns a list of two lists.
// The first is a list of acquaintances in the order they became an acquaintance (see example).
// The second is a list of friends in the order they became a friend.
// Words in the friend list should no longer be in the acquaintance list.

// Example
// noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly.")
// ➞ [["spot", "see"], []]
/// "see" was encountered first but "spot" became an acquaintance earlier.

List<List> noStrangers(String sentence) {
  List<List> acquaintanceAndFriendsLists = [[],[]];
  List listOfWords = List();
  Map<String,int> wordCount = Map<String,int>();

  RegExp re = RegExp(r'(\w+)');
  Iterable matches = re.allMatches(sentence).toList();
  matches.forEach((match) {
    listOfWords.add(sentence.substring(match.start, match.end));
  });
  //print(listOfWords);

  listOfWords.forEach((word) => wordCount[word] = wordCount.containsKey(word) ? wordCount[word] + 1 : 1);
  wordCount.forEach((key, val) {
    if (wordCount[key] >= 5) {
      acquaintanceAndFriendsLists[1].add(key);
    }
  });
  wordCount.forEach((key, val) {
    if (wordCount[key] >= 3) {
      acquaintanceAndFriendsLists[0].add(key);
    }
  });






//  for(int i = 0; i < listOfWords.length; i++){
//    RegExp regExp;
//    regExp = RegExp(listOfWords[i]);
//    print(regExp.allMatches(sentence).length);
//  }

//  var result = LinkedHashSet<String>.from(listOfWords).toList();
//  print(result);
  return acquaintanceAndFriendsLists;
}

// Challenge 3
// Rhyme Time
// Create a function that returns true if two lines rhyme and false otherwise.
// For the purposes of this exercise, two lines rhyme if the last
// word from each sentence contains the same vowels.
// Example:
// doesRhyme("Sam I am!", "Green eggs and ham.") ➞ true

bool doesRhyme(String firstString, String secondString) {
  List vowels = ['a','e','i','o','u'];
  List firstStringVowelsList = [];
  List secondStringVowelsList = [];

  RegExp re = RegExp(r'(\w+)');
  String firstStringVowels = '';
  String secondStringVowels = '';

  List firstStringList = [];
  Iterable matches = re.allMatches(firstString).toList();
  matches.forEach((match) {
    firstStringList.add(firstString.substring(match.start, match.end));
  });
  List firstStringLast = firstStringList[firstStringList.length-1].split('');


  List secondStringList = [];
  Iterable matches2 = re.allMatches(secondString).toList();
  matches2.forEach((match) {
    secondStringList.add(secondString.substring(match.start, match.end));
  });
  List secondStringLast = secondStringList[secondStringList.length-1].split('');


  firstStringLast.forEach((letter) => vowels.contains(letter) ? firstStringVowelsList.add(letter) : null);
  secondStringLast.forEach((letter) => vowels.contains(letter) ? secondStringVowelsList.add(letter) : null);
  firstStringVowels = firstStringVowelsList.join('');
  secondStringVowels = secondStringVowelsList.join('');

  if(secondStringVowels == firstStringVowels){
    return true;
  }
  else{
    return false;
  }
}

// Challenge 4
// Do All Bigrams (2 character words) Exist?
// You are given an input list of bigrams, and a list of words.
//
// Write a function that returns true if you can find every single bigram from
// this list can be found at least once in an list of words.
//
// Examples
// canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true

bool canFind(List biGrams, List words) {
  List<List> wordsListsList = List<List>();
  List boolList = [];
  letterPairForEachWordList(String word){
    List letterPairsList = [];
    List wordList = word.split('');
    wordList.forEach((letter) => (){
      wordList.indexOf(letter) < wordList.length - 1 ? letterPairsList.add(letter + wordList[wordList.indexOf(letter) + 1]) : null;
      wordsListsList.add(letterPairsList);
    });
  }


  words.forEach((word) => letterPairForEachWordList(word));

  wordsListsList.forEach((list) => biGrams.forEach((bigram) => boolList.add(list.contains(bigram))));

  if(boolList.contains(false)){
    return false;
  }
  else {
    return true;
  }

}

main() {
  print(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."));
  print(noStrangers("See Spot run. see Spot jump. Spot likes jumping. See Spot fly."));
  print(doesRhyme("Sam I am!", "Green eggs and ham."));
  print(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]));
}
