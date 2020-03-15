#!/usr/bin/perl
use warnings;
use strict;

my $random = int rand(100) + 1;
my $turncounter = 10;
my $gamestate = 1;
my @guesses;

while ($gamestate) 
{
	print "\n\nYou have $turncounter turns remaining\n";
	print "Previous Guesses: @guesses\n";
	print "Please guess a number between 1 and 100: ";
	my $guess = <STDIN>;
	chomp $guess;

	my $validinput = 1;
	if ($guess =~ /^[1-9]$/ || $guess =~ /^[1-9][0-9]$/ || $guess =~ /^100$/) 
	{
		foreach ( @guesses ) 
		{
			if ($_ == $guess) 
			{
				$validinput = 0;
				print "This guess ($guess) has already been tried.\n";
			}
		}
	}
	else 
	{
		print "Incorrect input\n";
		$validinput = 0;
	}
	
	if ($validinput == 1) 
	{
		$turncounter--;
		push(@guesses, $guess);

		if ($guess < $random) { print "Your guess ($guess) is less than the random number\n"; }
		if ($guess > $random) { print "Your guess ($guess) is more than the random number\n"; }
		if ($guess == $random)
		{
			print "Your guess ($guess) matches the random number ($random)\n";
			$gamestate = 0;
			last;
		}
	}

	if ($turncounter <= 0)
	{
		print "You have run out of turns\n";
		$gamestate = 0;
		last;
	}
}
