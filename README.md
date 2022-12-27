# Hangman notebook

```elixir
Dictionary
```

## Section MAIN:

### All the `api's` in `File`

#### API

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(4)> File.
        CopyError        Error            LinkError        RenameError
Stat             Stream           cd!/1            cd!/2
cd/1             chgrp!/2         chgrp/2          chmod!/2
chmod/2          chown!/2         chown/2          close/1
copy!/2          copy!/3          copy/2           copy/3
cp!/2            cp!/3            cp/2             cp/3
cp_r!/2          cp_r!/3          cp_r/2           cp_r/3
cwd!/0           cwd/0            dir?/1           dir?/2
exists?/1        exists?/2        ln!/2            ln/2
ln_s!/2          ln_s/2           ls!/0            ls!/1
ls/0             ls/1             lstat!/1         lstat!/2
lstat/1          lstat/2          mkdir!/1         mkdir/1
mkdir_p!/1       mkdir_p/1        open!/1          open!/2
open!/3          open/1           open/2           open/3
read!/1          read/1           read_link!/1     read_link/1
regular?/1       regular?/2       rename!/2        rename/2
rm!/1            rm/1             rm_rf!/1         rm_rf/1
rmdir!/1         rmdir/1          stat!/1          stat!/2
stat/1           stat/2           stream!/1        stream!/2
stream!/3        touch!/1         touch!/2         touch/1
touch/2          write!/2         write!/3         write/2
write/3          write_stat!/2    write_stat!/3    write_stat/2
write_stat/3     
```

<!-- livebook:{"break_markdown":true} -->

### Using help to look into the `File.read` `api`

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(4)> h File.read

                                 def read(path)                                 

  @spec read(Path.t()) :: {:ok, binary()} | {:error, posix()}

Returns {:ok, binary}, where binary is a binary data object that contains the
contents of path, or {:error, reason} if an error occurs.

Typical error reasons:

  • :enoent  - the file does not exist
  • :eacces  - missing permission for reading the file, or for searching
    one of the parent directories
  • :eisdir  - the named file is a directory
  • :enotdir - a component of the file name is not a directory; on some
    platforms, :enoent is returned instead
  • :enomem  - there is not enough memory for the contents of the file

You can use :file.format_error/1 to get a descriptive string of the error.
```

<!-- livebook:{"break_markdown":true} -->

### Another example of `File.read!` but this time with `!`

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(5)> h File.read!

                                def read!(path)                                 

  @spec read!(Path.t()) :: binary()

Returns a binary with the contents of the given filename, or raises a
File.Error exception if an error occurs.
```

<!-- livebook:{"break_markdown":true} -->

### When we use `File.read!` in `IEX` this is the result

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(7)> File.read!("assets/words.txt")
"that\nthis\nwith\nfrom\nyour\nhave\nmore\nwill\nhome\nabout\npage\nsearch\nfree\nother\ninformation\ntime\nthey\nsite\nwhat\nwhich\ntheir\nnews\nthere\nonly\nwhen\ncontact\nhere\nbusiness\nalso\nhelp\nview\nonline\nfirst\nbeen\nwould\nwere\nservices\nsome\nthese\nclick\nlike\nservice\nthan\nfind\nprice\ndate\nback\npeople\nlist\nname\njust\nover\nstate\nyear\ninto\nemail\nhealth\nworld\nnext\nused\nwork\nlast\nmost\nproducts\nmusic\ndata\nmake\nthem\nshould\nproduct\nsystem\npost\ncity\npolicy\nnumber\nsuch\nplease\navailable\ncopyright\nsupport\nmessage\nafter\nbest\nsoftware\nthen\ngood\nvideo\nwell\nwhere\ninfo\nrights\npublic\nbooks\nhigh\nschool\nthrough\neach\nlinks\nreview\nyears\norder\nvery\nprivacy\nbook\nitems\ncompany\nread\ngroup\nneed\nmany\nuser\nsaid\ndoes\nunder\ngeneral\nresearch\nuniversity\njanuary\nmail\nfull\nreviews\nprogram\nlife\nknow\ngames\ndays\nmanagement\npart\ncould\ngreat\nunited\nhotel\nreal\nitem\ninternational\ncenter\nebay\nmust\nstore\ntravel\ncomments\nmade\ndevelopment\nreport\nmember\ndetails\nline\nterms\nbefore\nhotels\nsend\nright\ntype\nbecause\nlocal\nthose\nusing\nresults\noffice\neducation\nnational\ndesign\ntake\nposted\ninternet\naddress\ncommunity\nwithin\nstates\narea\nwant\nphone\nshipping\nreserved\nsubject\nbetween\nforum\nfamily\nlong\nbased\ncode\nshow\neven\nblack\ncheck\nspecial\nprices\nwebsite\nindex\nbeing\nwomen\nmuch\nsign\nfile\nlink\nopen\ntoday\ntechnology\nsouth\ncase\nproject\nsame\npages\nversion\nsection\nfound\nsports\nhouse\nrelated\nsecurity\nboth\ncounty\namerican\nphoto\ngame\nmembers\npower\nwhile\ncare\nnetwork\ndown\ncomputer\nsystems\nthree\ntotal\nplace\nfollowing\ndownload\nwithout\naccess\nthink\nnorth\nresources\ncurrent\nposts\nmedia\ncontrol\nwater\nhistory\npictures\nsize\npersonal\nsince\nincluding\nguide\nshop\ndirectory\nboard\nlocation\nchange\nwhite\ntext\nsmall\nrating\nrate\ngovernment\nchildren\nduring\nreturn\nstudents\nshopping\naccount\ntimes\nsites\nlevel\ndigital\nprofile\nprevious\nform\nevents\nlove\njohn\nmain\ncall\nhours\nimage\ndepartment\ntitle\ndescription\ninsurance\nanother\nshall\nproperty\nclass\nstill\nmoney\nquality\nevery\nlisting\ncontent\ncountry\nprivate\nlittle\nvisit\nsave\ntools\nreply\ncustomer\ndecember\ncompare\nmovies\ninclude\ncollege\nvalue\narticle\nyork\ncard\njobs\nprovide\nfood\nsource\nauthor\ndifferent\npress\nlearn\nsale\naround\nprint\ncourse\ncanada\nprocess\nteen\nroom\nstock\ntraining\ncredit\npoint\njoin\nscience\ncategories\nadvanced\nwest\nsales\nlook\nenglish\nleft\nteam\nestate\nconditions\nselect\nwindows\nphotos\nthread\nweek\ncategory\nnote\nlive\nlarge\ngallery\ntable\nregister\nhowever\njune\noctober\nnovember\nmarket\nlibrary\nreally\naction\nstart\nseries\nmodel\nfeatures\nindustry\nplan\nhuman\nprovided\nrequired\nsecond\naccessories\ncost\nmovie\nforums\nmarch\nseptember\nbetter\nquestions\njuly\nyahoo\ngoing\nmedical\ntest\nfriend\ncome\nserver\nstudy\napplication\ncart\nstaff\narticles\nfeedback\nagain\nplay\nlooking\nissues\napril\nnever\nusers\ncomplete\nstreet\ntopic\ncomment\nfinancial\nthings\nworking\nagainst\nstandard\nperson\nbelow\nmobile\nless\nblog\nparty\npayment\nequipment\nlogin\nstudent\nprograms\noffers\nlegal\nabove\nrecent\npark\nstores\nside\nproblem\ngive\nmemory\nperformance\nsocial\naugust\nquote\nlanguage\nstory\nsell\noptions\nexperience\nrates\ncreate\nbody\nyoung\namerica\nimportant\nfield\neast\npaper\nsingle\nactivities\nclub\nexample\ngirls\nadditional\npassword\nlatest\nsomething\nroad\ngift\nquestion\nchanges\nnight\nhard\ntexas\nfour\npoker\nstatus\nbrowse\nissue\nrange\nbuilding\nseller\ncourt\nfebruary\nalways\nresult\naudio\nlight\nwrite\noffer\nblue\ngroups\neasy\ngiven\nfiles\nevent\nrelease\nanalysis\nrequest\nchina\nmaking\npicture\nneeds\npossible\nmight\nprofessional\nmonth\nmajor\nstar\nareas\nfuture\nspace\ncommittee\nhand\ncards\nproblems\nlondon\nwashington\nmeeting\nbecome\ninterest\nchild\nkeep\nenter\ncalifornia\nshare\nsimilar\ngarden\nschools\nmillion\nadded\nreference\ncompanies\nlisted\nbaby\nlearning\nenergy\ndelivery\npopular\nterm\nfilm\nstories\ncomputers\njournal\nreports\nwelcome\ncentral\nimages\npresident\nnotice\noriginal\nhead\nradio\nuntil\ncell\ncolor\nself\ncouncil\naway\nincludes\ntrack\naustralia\ndiscussion\narchive\nonce\nothers\nentertainment\nagreement\nformat\nleast\nsociety\nmonths\nsafety\nfriends\nsure\ntrade\nedition\ncars\nmessages\nmarketing\ntell\nfurther\nupdated\nassociation\nable\nhaving\nprovides\ndavid\nalready\ngreen\nstudies\nclose\ncommon\ndrive\nspecific\nseveral\ngold\nliving\ncollection\ncalled\nshort\narts\ndisplay\nlimited\npowered\nsolutions\nmeans\ndirector\ndail" <> ...
```

<!-- livebook:{"break_markdown":true} -->

### IT WORKS!

<!-- livebook:{"break_markdown":true} -->

### Looking at the String module to `split` our word list

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(8)> String.
Break                 Chars                 Tokenizer             
Unicode               at/2                  bag_distance/2        
capitalize/1          capitalize/2          chunk/2               
codepoints/1          contains?/2           downcase/1            
downcase/2            duplicate/2           ends_with?/2          
equivalent?/2         first/1               graphemes/1           
jaro_distance/2       last/1                length/1              
match?/2              myers_difference/2    next_codepoint/1      
next_grapheme/1       normalize/2           pad_leading/2         
pad_leading/3         pad_trailing/2        pad_trailing/3        
printable?/1          printable?/2          replace/3             
replace/4             replace_leading/3     replace_prefix/3      
replace_suffix/3      replace_trailing/3    reverse/1             
slice/2               slice/3               split/1               
split/2               split/3               split_at/2            
splitter/2            splitter/3            starts_with?/2        
to_atom/1             to_charlist/1         to_existing_atom/1    
to_float/1            to_integer/1          to_integer/2          
trim/1                trim/2                trim_leading/1        
trim_leading/2        trim_trailing/1       trim_trailing/2       
upcase/1              upcase/2              valid?/1   
```

<!-- livebook:{"break_markdown":true} -->

### Asking `IEX` for help with `String.split/1<-arity`

<img width="250" alt="Screenshot 2022-12-17 at 12 29 47 PM" src="https://user-images.githubusercontent.com/44812411/208254190-1e67ccf8-7792-4cde-9f05-01add7ea5e90.png" />

<img width="280" alt="Screenshot 2022-12-17 at 12 29 34 PM" src="https://user-images.githubusercontent.com/44812411/208254192-14c38f57-3402-485a-8b21-81fee38f6039.png" />

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(8)> h String.split/1

                               def split(binary)                                

  @spec split(t()) :: [t()]

delegate_to: String.Break.split/1

Divides a string into substrings at each Unicode whitespace occurrence with
leading and trailing whitespace ignored. Groups of whitespace are treated as a
single occurrence. Divisions do not occur on non-breaking whitespace.

## Examples

    iex> String.split("foo bar")
    ["foo", "bar"]
    
    iex> String.split("foo" <> <<194, 133>> <> "bar")
    ["foo", "bar"]
    
    iex> String.split(" foo   bar ")
    ["foo", "bar"]
    
    iex> String.split("no\u00a0break")
    ["no\u00a0break"]
```

#### It will return the `use-case` with examples for the `split/1` function

<!-- livebook:{"break_markdown":true} -->

### Lets test out the `split/1` function

```elixir
sample_string = "123\n456\n789\n"
```

```elixir
# split the string on \n using a regular expression (Will hav an empty string at the end)
String.split(sample_string, ~r/\n/)
```

```elixir
# because there was an extra \n at the end of our sample_string
# we ended up with a extra empty string in our list
# to remove that we will do the following
String.split(sample_string, ~r/\n/, trim: true)
```

### Now to split our words list

```elixir
path =
  Path.expand("../dictionary/assets", __DIR__)
  |> Path.join("words.txt")

words = File.read!(path)
```

```elixir
String.split(words, ~r/\n/, trim: true)
```

```elixir
# Lets implement all this live
defmodule Dictionary do
  @words_list_path Path.expand("../dictionary/assets", __DIR__)
                   |> Path.join("words.txt")

  def word_list do
    @words_list_path
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def random_word do
    Enum.random(word_list())
  end
end

# ========================================================

words = Dictionary.word_list()
```

### lets now try to find a way to randomize the words, inside the list module

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(4)> List.
Chars                 ascii_printable?/1    ascii_printable?/2    
delete/2              delete_at/2           duplicate/2           
first/1               first/2               flatten/1             
flatten/2             foldl/3               foldr/3               
improper?/1           insert_at/3           keydelete/3           
keyfind!/3            keyfind/3             keyfind/4             
keymember?/3          keyreplace/4          keysort/2             
keysort/3             keystore/4            keytake/3             
last/1                last/2                myers_difference/2    
myers_difference/3    pop_at/2              pop_at/3              
replace_at/3          starts_with?/2        to_atom/1             
to_charlist/1         to_existing_atom/1    to_float/1            
to_integer/1          to_integer/2          to_string/1           
to_tuple/1            update_at/3           wrap/1                
zip/1   
```

#### unfortunately that did not work, but you can use an `Enum`

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(4)> Enum.
EmptyError           OutOfBoundsError     all?/1               
all?/2               any?/1               any?/2               
at/2                 at/3                 chunk_by/2           
chunk_every/2        chunk_every/3        chunk_every/4        
chunk_while/4        concat/1             concat/2             
count/1              count/2              count_until/2        
count_until/3        dedup/1              dedup_by/2           
drop/2               drop_every/2         drop_while/2         
each/2               empty?/1             fetch!/2             
fetch/2              filter/2             find/2               
find/3               find_index/2         find_value/2         
find_value/3         flat_map/2           flat_map_reduce/3    
frequencies/1        frequencies_by/2     group_by/2           
group_by/3           intersperse/2        into/2               
into/3               join/1               join/2               
map/2                map_every/3          map_intersperse/3    
map_join/2           map_join/3           map_reduce/3         
max/3                max_by/2             max_by/4             
member?/2            min/3                min_by/2             
min_by/4             min_max/1            min_max/2            
min_max_by/2         min_max_by/4         product/1            
random/1             reduce/2             reduce/3             
reduce_while/3       reject/2             reverse/1            
reverse/2            reverse_slice/3      scan/2               
scan/3               shuffle/1            slice/2              
slice/3              slide/3              sort/1               
sort/2               sort_by/2            sort_by/3            
split/2              split_while/2        split_with/2         
sum/1                take/2               take_every/2         
take_random/2        take_while/2         to_list/1            
uniq/1               uniq_by/2            unzip/1              
with_index/1         with_index/2         zip/1                
zip/2                zip_reduce/3         zip_reduce/4         
zip_with/2           zip_with/3   
```

<!-- livebook:{"break_markdown":true} -->

### we end up finding `Enum.random/1`

#### let's see the help input to learn more about it

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(4)> h Enum.random

                             def random(enumerable)                             

  @spec random(t()) :: element()

Returns a random element of an enumerable.

Raises Enum.EmptyError if enumerable is empty.

This function uses Erlang's :rand module (:rand) to calculate the random value.
Check its documentation for setting a different random algorithm or a different
seed.

The implementation is based on the reservoir sampling
(https://en.wikipedia.org/wiki/Reservoir_sampling#Relation_to_Fisher-Yates_shuffle)
algorithm. It assumes that the sample being returned can fit into memory; the
input enumerable doesn't have to, as it is traversed just once.

If a range is passed into the function, this function will pick a random value
between the range limits, without traversing the whole range (thus executing in
constant time and constant memory).

## Examples

The examples below use the :exsss pseudorandom algorithm since it's the default
from Erlang/OTP 22:

    # Although not necessary, let's seed the random algorithm
    iex> :rand.seed(:exsss, {100, 101, 102})
    iex> Enum.random([1, 2, 3])
    2
    iex> Enum.random([1, 2, 3])
    1
    iex> Enum.random(1..1_000)
    309
```

<!-- livebook:{"break_markdown":true} -->

### using our new random_word function

```elixir
Dictionary.random_word()
```

## Section: EPIC0001

### There are two ways of specifying an atom in Elixir. The first is to prefix a name or an operator with a colon. Here are some atoms using that notation:

```elixir
atoms = [:cat, :puppy_dog, :>=]
```

### Sometimes you need to create atoms that contain characters that aren't allowed in normal names. Do this by enclosing them in double quotes:

```elixir
crazy_atoms = [:"cat-dog", :"now is the time", :"!@$%^&UIO"]

# looped_atoms =
#   Enum.each(
#     crazy_atoms,
#     fn atom -> IO.inspect(IEx.Info.info(atom), label: "atom type") end
#   )

looped_atoms =
  for atom <- crazy_atoms do
    IO.puts("*. atom name: #{inspect(atom)}")
    IO.puts("*. is atom?: #{inspect(is_atom(atom))}\n")
  end
```

### This format also allows you to embed the result of evaluating code in your atom names:

```elixir
a = 99
```

```elixir
:"next-number: #{a + 1}"
```

## Section: EPIC0003

### Send & receive processes

```elixir
defmodule Procs do
  def receiving(count) do
    receive do
      {:crash, reason} ->
        exit(reason)

      # we will quit without a recursive call
      {:quit} ->
        IO.inspect({:quit}, label: "Program quit")

      # pattern matching recursively
      {:add, n} ->
        IO.inspect(receiving(count + n), label: "{:add, n}")

      msg ->
        IO.puts("#{count}: Hello #{inspect(msg)}")
        # using tail recursion
        receiving(count + 1)
        receiving(count)
    end
  end
end

pid = spawn_link(Procs, :receiving, [0])
# sending a message to the pid
send(pid, "Hola")

# to show our process ended
send(pid, "Again")
send(pid, [1, 2, 3])
send(pid, 17.0)
send(pid, :alias_one_11)

# running a background process that is maintaining its own state
send(pid, {:add, 17})
send(pid, {:quit})

# process should not be alive after :quit
send(pid, {:crash, :normal})
Process.alive?(pid)
```

### Using Agents instead of processes

#### Agents in IEX

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(1)> h Agent.st
start/1         start/2         start/3         start/4
start_link/1    start_link/2    start_link/3    start_link/4
stop/1          stop/2          stop/3
```

<!-- livebook:{"break_markdown":true} -->

### Agent.start_link

#### api's

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(1)> h Agent.start_link
start_link/1    start_link/2    start_link/3    start_link/4
```

### API examples/references

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(1)> h Agent.start_link

                       def start_link(fun, options \\ [])

  @spec start_link((() -> term()), GenServer.options()) :: on_start()

Starts an agent linked to the current process with the given function.

This is often used to start the agent as part of a supervision tree.

Once the agent is spawned, the given function fun is invoked in the server
process, and should return the initial agent state. Note that start_link/2 does
not return until the given function has returned.

## Options

The :name option is used for registration as described in the module
documentation.

If the :timeout option is present, the agent is allowed to spend at most the
given number of milliseconds on initialization or it will be terminated and the
start function will return {:error, :timeout}.

If the :debug option is present, the corresponding function in the :sys module
(:sys) will be invoked.

If the :spawn_opt option is present, its value will be passed as options to the
underlying process as in Process.spawn/4.

## Return values

If the server is successfully created and initialized, the function returns
{:ok, pid}, where pid is the PID of the server. If an agent with the specified
name already exists, the function returns {:error, {:already_started, pid}}
with the PID of that process.

If the given function callback fails, the function returns {:error, reason}.

## Examples

    iex> {:ok, pid} = Agent.start_link(fn -> 42 end)
    iex> Agent.get(pid, fn state -> state end)
    42

    iex> {:error, {exception, _stacktrace}} = Agent.start(fn -> raise "oops" end)
    iex> exception
    %RuntimeError{message: "oops"}


                def start_link(module, fun, args, options \\ [])

  @spec start_link(module(), atom(), [any()], GenServer.options()) :: on_start()

Starts an agent linked to the current process.

Same as start_link/2 but a module, function, and arguments are expected instead
of an anonymous function; fun in module will be called with the given arguments
args to initialize the state.
```

##### We always use a function to manipulate the state inside of an `Agent`

```elixir
{:ok, counter} = Agent.start_link(fn -> 0 end)

# Agent.get(counter, fn state -> state end)
# # update->1
# Agent.update(counter, fn state -> state + 1 end)
# Agent.get(counter, fn state -> state end)
# # update->2
# Agent.update(counter, fn state -> state + 1 end)
# Agent.get(counter, fn state -> state end)

Agent.get_and_update(
  counter,
  fn state -> IO.inspect({state, state + 1}, label: "get_and_update") end
)

Agent.get_and_update(
  counter,
  fn state -> IO.inspect({state, state + 1}, label: "get_and_update") end
)
```

### Converting our dictionary api by way of refactoring it with `Agents`

<img width="750" alt="Screenshot 2022-12-26 at 2 34 55 PM" src="https://user-images.githubusercontent.com/44812411/209578926-79faf300-8c95-4cc2-bc5d-831b75d6a71c.png" />

<img width="750" alt="Screenshot 2022-12-26 at 2 40 35 PM" src="https://user-images.githubusercontent.com/44812411/209579114-a3ca7a30-ca01-48b3-90c2-ed679ec0c916.png" />

<img width="750" alt="Screenshot 2022-12-26 at 2 39 53 PM" src="https://user-images.githubusercontent.com/44812411/209579117-41d519de-4c60-4eea-8b2b-b9e7274021c6.png" />

<!-- livebook:{"break_markdown":true} -->

### using our runtime Agent for the Dictionary API

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(1)> alias Dictionary.Runtime.Server
Dictionary.Runtime.Server
iex(2)> {:ok, pid} = Server.start_link
{:ok, #PID<0.241.0>}
iex(3)> 
...
iex(4)> Server.random_word(pid)
"palm"
iex(5)> Server.random_word(pid)
"flame"
iex(6)> Server.random_word(pid)
"causes"
iex(7)> Server.random_word(pid)
"careful"
iex(8)> Server.random_word(pid)
"else"

```

<!-- livebook:{"break_markdown":true} -->

### How we use the Dictionary API after adding our new `Agent`

<!-- livebook:{"force_markdown":true} -->

```elixir
iex(1)> {:ok, pid} = Dictionary.start_link
{:ok, #PID<0.262.0>}
...
iex(2)> Dictionary.random_word(pid)
"sought"
iex(3)> Dictionary.random_word(pid)
"labs"
iex(4)> Dictionary.random_word(pid)
"taught"
iex(5)> Dictionary.random_word(pid)
"security"
iex(6)> Dictionary.random_word(pid)
"antibodies"

```

<!-- livebook:{"break_markdown":true} -->

### Our next steps... Converting our Dictionary library into an `Application`

<img width="750" alt="Screenshot 2022-12-26 at 4 15 12 PM" src="https://user-images.githubusercontent.com/44812411/209583732-87cc2e0c-e23e-407e-abf7-2fb49db93a89.png" />

<img width="750" alt="Screenshot 2022-12-26 at 4 14 52 PM" src="https://user-images.githubusercontent.com/44812411/209583735-ef3b911b-ad34-4207-9c99-29bd46baa087.png" />

<img width="750" alt="Screenshot 2022-12-26 at 4 14 03 PM" src="https://user-images.githubusercontent.com/44812411/209583736-361064bf-a128-4ba8-adb0-8866874606bd.png" />
