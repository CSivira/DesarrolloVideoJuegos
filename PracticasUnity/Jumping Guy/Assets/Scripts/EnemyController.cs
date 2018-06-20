using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {

	public float velocity = 2f;

	private Rigidbody2D rb2d;

	// Use this for initialization
	void Start () {
		rb2d = GetComponent<Rigidbody2D> ();
		rb2d.velocity = Vector3.left * velocity;
		//rb2d.velocity no tiene nada que ver con la variable velocity declarada publica, son distintas.
		//rb2d.velocity es una propiedad de riggidody2d
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnTriggerEnter2D (Collider2D other){
		if (other.gameObject.tag == "Destroyer"){
			Destroy (gameObject);
		}
	}
}
