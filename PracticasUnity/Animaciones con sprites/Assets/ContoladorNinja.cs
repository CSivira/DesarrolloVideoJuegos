using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ContoladorNinja : MonoBehaviour {

	public float OffsetX = 0;
	public float OffsetY = 0;
	public GameObject kunaiPrefab;

	private Animator animator;

	// Use this for initialization
	void Start () {
		animator = GetComponent <Animator> ();
	}
	
	// Update is called once per frame
	void Update () {
		//Ataque
		if (Input.GetKeyDown (KeyCode.Space)) {
			animator.SetTrigger ("Atacar");			
		}
		//Lanzar
		if (Input.GetKeyDown (KeyCode.Z)) {
			animator.SetTrigger ("Lanzar");
		}
	}

	void LanzarKunai (){
		GameObject Kunai = Instantiate (kunaiPrefab, transform.position, Quaternion.identity);
		Kunai.transform.position += new Vector3 (OffsetX, OffsetY, 0); 
	}
}
