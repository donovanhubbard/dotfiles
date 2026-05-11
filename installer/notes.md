# notes

## Arrays

Creation: arr=(val1 val2 val3) or typeset -a arr
Access Element: $arr[1] (first element) or $arr[-1] (last element)
All Elements: $arr[@] or just $arr
Array Length: $#arr
Append: arr+=(val4)
Slicing: $arr[1,3] (elements 1 through 3)
Remove first element from an array (shift)	shift VARNAME
Remove last element from an array (pop)	shift -p VARNAME
Iterate over an array's values	for value in $VARNAME;
Remove an element from an array	VARNAME[index]=()

https://gist.github.com/ClementNerma/1dd94cb0f1884b9c20d1ba0037bdcde2


Get the value of a variable whose name is in another variable	${(P)NAMEVAR}
Delete a variable	unset VARNAME


# serializing

## maps
```yaml
favoriteMovie: Jaws
favorieFood: ice cream
favoritColor: blue
```

becomes

```bash
favoriteMovie:"Jaws"favoriteFood:"ice cream"favoriteColor:"blue"
```

Nested:
```yaml
favorite:
  food: ice cream
  movie: jaws
  color: read
hated:
  food: pickles
  movie: twilight
  color: purple
```
becomes:

```
favorite:"food:"ice cream"movie:"jaws"color:"red""hated:"food:"pickles"movie:"twilight"color:"purple""

## arrays

Arrays start and end with parenthesis and is space delimited.

```yaml
foods:
- eggs
- grilled cheese
- ham
```
becomes
```bash
foods:("eggs","grilled cheese","ham")
```

## mixed

```yaml
dotfiles:
  - symlinkTarget: nvim
    symlinkPath: ~/.config/nvim
  - symlinkPath: ~/.tmux.conf
    symlinkTarget: tmux/tmux.conf
  - symlinkTarget: "kitty"
    symlinkPath: "~/.config/kitty"
  - symlinkPath: bad
  - symlinkTarget: alsoBad
anotherBadEntry: yes
```

becomes
```bash
dotfiles:("symlinkTarget:"nvim"symlinkPath:".config","symlinkTarget:"foo"symlinkPath:"bar") 
