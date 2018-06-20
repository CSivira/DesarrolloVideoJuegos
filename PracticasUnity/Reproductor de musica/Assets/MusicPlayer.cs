using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MusicPlayer : MonoBehaviour {

	public AudioClip[] clips;

	private int index = 0;
	private AudioSource player;
	private Text title, timer;
	private Animator animator;

	// Use this for initialization
	void Start () {
		player = GetComponent<AudioSource> (); 
		player.clip = clips[index];

		//Captando el componente de texto en title
		title = transform.Find ("Title").gameObject.GetComponent<Text> ();
		title.text = player.clip.name;

		timer = transform.Find ("Timer").gameObject.GetComponent<Text> ();

		animator = transform.Find ("Image").gameObject.GetComponent<Animator> ();
		animator.enabled = false;
	}

	public void Play() {
		if (CheckNullSong ()) return;

		if (!player.isPlaying) {
			player.Play (); 
			animator.enabled = true;

			CancelInvoke ("Next");
			Invoke ("Next", player.clip.length - player.time + 1f);
		} else {
			player.Pause ();
			animator.enabled = false;

			CancelInvoke ("Next");
		}
	}

	public void Stop(){
		player.Stop ();
		animator.enabled = false;

		CancelInvoke ("Next");
	}

	public void Next() {
		player.clip = clips[++index % clips.Length];
		if (CheckNullSong ()) return;
		player.Play (); 
		title.text = player.clip.name;
		animator.enabled = true;

		CancelInvoke ("Next");
		Invoke ("Next", player.clip.length+ 1f);
	}

	public void Prev() {
		if (--index < 0)	index = clips.Length - 1;
		player.clip = clips[index % clips.Length];
		if (CheckNullSong ()) return;
		player.Play ();
		title.text = player.clip.name;
		animator.enabled = true;

		CancelInvoke ("Next");
		Invoke ("Next", player.clip.length+ 1f);
	}

	// Update is called once per frame
	void Update () {
		int minutes = (int)player.time / 60;
		int seconds = (int)player.time % 60;

		timer.text = minutes.ToString ("00") + ":" + seconds.ToString ("00");
	}

	bool CheckNullSong (){
		if (player.clip == null) {
			Debug.Log ("Null Song");
			animator.enabled = false;
			title.text = "Pista no encontrada";

			CancelInvoke ("Next");
			Invoke ("Next", 3f);
			return true;
		}
		return false;
	}
}
