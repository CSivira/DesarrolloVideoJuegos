using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

	public GameObject game;
	public GameObject enemyGenerator;
	public AudioClip jumpClip;
	public AudioClip dieClip;
	public AudioClip pointClip;

	public ParticleSystem dust;

	private AudioSource audioPlayer;
	private Animator animator;
	private float startY;

	// Use this for initialization
	void Start () {
		animator = GetComponent<Animator> ();
		audioPlayer = GetComponent<AudioSource> ();
		startY = transform.position.y;
	}
	
	// Update is called once per frame
	void Update () {
		bool gamePlaying = game.GetComponent<GameController>().gameState == GameState.Playing;
		bool usserAction = (Input.GetKeyDown ("up") || Input.GetMouseButtonDown (0));
		bool isGrounded = transform.position.y == startY;

		if (gamePlaying && usserAction && isGrounded) {
			UpdateState ("PlayerJump");

			audioPlayer.clip = jumpClip;
			audioPlayer.Play ();
		}
	}
	//Estado de player
	public void UpdateState (string state = null){
		if (state != null) {
			animator.Play (state);
		}
	}
	//Muerte de player
	void OnTriggerEnter2D (Collider2D other){
		if (other.gameObject.tag == "Enemy") {
			UpdateState ("PlayerDie");
			game.GetComponent<GameController> ().gameState = GameState.Ended;
			enemyGenerator.SendMessage ("CancelGenerator", true);
			game.SendMessage ("ResetTimeScale", 0.5f);

			game.GetComponent<AudioSource> ().Stop ();
			audioPlayer.clip = dieClip;
			audioPlayer.Play ();

			DustStop ();
		} else if (other.gameObject.tag == "Point") {
			game.SendMessage("IncreasePoints");
			audioPlayer.clip = pointClip;
			audioPlayer.Play ();
		}
	}
	//Juego listo para reiniciar
	void GameReady (){
		game.GetComponent<GameController> ().gameState = GameState.Ready;
	}

	void DustPlay() {
		dust.Play ();
	}

	void DustStop() {
		dust.Stop ();
	}
}
