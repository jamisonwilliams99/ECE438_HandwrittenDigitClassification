num_correct = 0;
num_incorrect = 0;
num_errs = 0;
incorrect_guesses = [];
for i = 0 : 9
    switch i
        case 0
            number = "zero";
        case 1
            number = "one";
        case 2
            number = "two";
        case 3
            number = "three";
        case 4
            number = "four";
        case 5
            number = "five";
        case 6
            number = "six";
        case 7
            number = "seven";
        case 8
            number = "eight";
        case 9
            number = "nine";
    end

    for j = 11 : 20
        numID = number + "_" + int16(j);
        filename = "../" + number + "s/test/" + numID + ".jpg";
        I = imread(filename);
        
        guess = digit_guesser(I);

        if (guess == number)
            num_correct = num_correct + 1;
        elseif (guess == "-1")
            num_errs = num_errs + 1;
            disp("unable to load " + numID);
        else
            num_incorrect = num_incorrect + 1;
            disp(numID + " guessed incorrectly as " + guess);
        end

    end
end

disp(num_correct);
disp(num_incorrect);
disp(num_errs);

