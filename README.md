 _____           _     ______           _             
/  __ \         | |    | ___ \         | |            
| /  \/ ___   __| | ___| |_/ /_ __ __ _| | _____ _ __ 
| |    / _ \ / _` |/ _ \ ___ \ '__/ _` | |/ / _ \ '__|
| \__/\ (_) | (_| |  __/ |_/ / | | (_| |   <  __/ |   
 \____/\___/ \__,_|\___\____/|_|  \__,_|_|\_\___|_|   
                                                     

A great way to get started gathering user stories is to do a high-level brain dump of the sorts of things we might like to do. Here are some titles to get started:

    Start game - When a new game was started, the game generates secret code. The code should have 4 items.

    Code-breaker submits guess - The code-breaker propose a guess, and the system replies by marking the guess according to the marking algorithm.

    Code-breaker wins game - The code-breaker propose a guess that matches the secret code exactly. The system responds by marking the guess with four + signs.

    Code-breaker loses game - After some number of turns, the game tells the code-breaker that the game is over (need to decide how many turns and whether to reveal the code).

    Code-breaker plays again - After the game is won or lost, the system prompts the code-breaker to play again. If the code-breaker indicates yes, a new game begins. If the code-breaker indicates no, the system shuts down.

    Code-breaker requests hint - At any time during a game, the code-breaker can request a hint, at which point the system reveals one of the numbers in the secret code.

    Code-breaker saves score - After the game is won or lost, the code-breaker can opt to save information about the game: who (initials?), how many turns, and so on.
