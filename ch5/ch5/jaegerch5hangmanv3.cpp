//hangman v3.0

#include<iostream>
#include<string>
#include<vector>
#include<algorithm>
#include<ctime>
#include<cctype>

using namespace std;

void question();
char getGuess();
int checkGuess(const string tw, char g, string sf, int w);
string current(const string tw, char g, string sf);


int main(){
	//setup
	const int MAX_WRONG = 8; //max # of incorrect guesses allowed

	vector<string> words; //collection of possible words to guess
	words.push_back("GUESS");
	words.push_back("HANGMAN");
	words.push_back("DIFFICULT");

	srand(static_cast<unsigned int>(time(0)));
	random_shuffle(words.begin(), words.end());
	const string THE_WORD = words[0]; //word to guess
	int wrong = 0; //# of incorrect guesses
	string soFar(THE_WORD.size(), '-'); //word guessed so far
	string used = ""; //letters already guessed
	char guess;
	

	cout << "Welcome to Hangman. Good luck!\n";

	//main loop
	while ((wrong < MAX_WRONG) && (soFar != THE_WORD))
	{
		cout << "\n\nYou have " << (MAX_WRONG - wrong);
		cout << " incorrect guesses left.\n";
		cout << "\nYou've used the following letters:\n" << used << endl;
		cout << "\nSo far, the word is: \n" << soFar << endl;

		question();
		char guess = getGuess();

		while (used.find(guess) != string::npos)
		{
			cout << "\nYou've already guessed " << guess << endl;
			question();
			guess = getGuess();
		}

		used += guess;

		wrong = checkGuess(THE_WORD, guess, soFar, wrong);
		soFar = current(THE_WORD, guess, soFar);
	}
	//shutdown
	if (wrong == MAX_WRONG)
	{
		cout << "\nYou've been hanged!";
	}
	else{
		cout << "\nYou guessed it!";
	}

	cout << "\n The word was " << THE_WORD << endl;

	system("pause");
	return 0;
}

void question(){
	cout << "\n\nEnter your guess: ";
}

char getGuess(){
	
	char guess;
	cin >> guess;
	guess = toupper(guess); //make uppercase since secret word in uppercase
	
	return guess;
}

int checkGuess(const string tw, char g, string sf, int w){
	if (tw.find(g) != string::npos)
{
	cout << "That's right! " << g << " is in the word.\n";
	return w;
}
	else {
		cout << "Sorry, " << g << " isn't in the word.\n";
		++w;
		return w;
	}
}

string current(const string tw, char g, string sf){
	//update soFar to include newly guessed letter
	for (int i = 0; i < tw.length(); ++i)
	{
		if (tw[i] == g)
		{
			sf[i] = g;
		}
	}
	return sf;
}
