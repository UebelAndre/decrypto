
extern crate decrypto_game;
use decrypto_game::{
    fsm::*, mask, cb,
};

use super::state::GameState;
use super::words;

extern crate rand;
use rand::seq::SliceRandom;

use std::collections;


struct Player {
    name: String,
}

struct Team {
    /// Desired name of the team. This can also act as a unique identifier
    name: String,

    /// List of players on the team
    players: Vec<Player>,

    /// The list of words the team has to work with for "encryption" and "decryption"
    cipher: Vec<String>,

    /// The current (generated) code the encrypter must provide encryption for
    current_code: Vec<i8>,

    /// The history of all generated codes for the team
    code_history: Vec<[i8; 3]>,

    /// The history of all the guessed codes for the team
    guess_history: Vec<[String; 3]>,

    /// The history of all "encrypted" codes
    submittion_history: Vec<[String; 3]>,

    /// The number of times the team has successfully intercepted the code
    interceptions: i8,

    /// The number of times the team has failed "decryption"
    failed_decryptions: i8,
}

pub struct Game {
    fsm: Fsm<GameState>,
    word_list: words::WordList,

    teams: collections::HashMap<String, Team>,
}

impl Game {
    pub fn new() -> Game {

        let mut game = Game {
            fsm: Fsm::new(GameState::DECRYPT),
            word_list: words::generate_word_list(),
            teams: collections::HashMap::new(),
        };
        

        game.fsm.register_state(
            GameState::DECRYPT,
            mask!(GameState::ENCRYPT),
            cb!(|| {
                
            }),
            cb!(|| {
                
            }),
            cb!(|| {

            }),
        );

        game.fsm.register_state(
            GameState::ENCRYPT,
            mask!(GameState::DECRYPT),
            cb!(|| {

            }),
            cb!(|| {

            }),
            cb!(|| {
                
            }),
        );

        game.fsm.update();
        game
    }

    pub fn get_word_list(&self) -> &words::WordList {
        &self.word_list
    }

    pub fn update(&mut self) {
        self.fsm.update();
    }

    pub fn register_team(&mut self, name: String, player_names: Vec<String>) {
        self.teams.insert(name.clone(), Team{
            name: name,
            players: player_names.into_iter().map(|player_name| -> Player {
                Player{
                    name: player_name,
                }
            }).collect(),
            cipher: self.generate_cipher(),
            current_code: self.generate_code(),
            code_history: Vec::new(),
            guess_history: Vec::new(),
            submittion_history: Vec::new(),
            interceptions: 0,
            failed_decryptions: 0,
        });
    }

    fn generate_cipher(&self) -> Vec<String> {
        self.word_list
        .choose_multiple(&mut rand::thread_rng(), 3)
        .map(|word| {
            String::from(*word)
        })
        .collect()
    }

    fn generate_code(&self) -> Vec<i8> {
        vec![0, 0, 0]
    }
}
