using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

	public float maxSpeed = 5f;
	public float speed = 2f;
	public bool grounded;
	public float jumpPower = 6.5f;

	private Rigidbody2D rb2d;
	private Animator animator;
	private bool jump;
	private bool doubleJump;

	// Use this for initialization
	void Start () {
		rb2d = GetComponent<Rigidbody2D> ();
		animator = GetComponent<Animator> ();
	}

	// Update is called once per frame
	void Update () {
		animator.SetFloat ("speed", Mathf.Abs (rb2d.velocity.x));
		animator.SetBool ("grounded", grounded);

		if (grounded) {
			doubleJump = true;
		}

		if (Input.GetKeyDown (KeyCode.UpArrow)){
			if (grounded) {
				jump = true;
				doubleJump = true;
			} else if (doubleJump) {
				jump = true;
				doubleJump = false;
			}
		}
	}

	void FixedUpdate() {

		Vector3 FixedVelocity = rb2d.velocity;
		FixedVelocity.x *= 0.75f;

		if (grounded) {
			rb2d.velocity = FixedVelocity;
		}

		float horizontal = Input.GetAxis ("Horizontal");

		rb2d.AddForce(Vector2.right * speed * horizontal);

		float limitedSpeed = Mathf.Clamp (rb2d.velocity.x,-maxSpeed,maxSpeed);
		rb2d.velocity = new Vector2 (limitedSpeed,rb2d.velocity.y);

		if (horizontal > 0.1f) {
			transform.localScale = new Vector3 (1f,1f,1f);
		}
		if (horizontal < -0.1f) {
			transform.localScale = new Vector3 (-1f,1f,1f);
		}

		if (jump) {
			rb2d.velocity = new Vector2 (rb2d.velocity.x,0f);
			rb2d.AddForce (Vector2.up * jumpPower, ForceMode2D.Impulse);
			jump = false;
		}

		Debug.Log (rb2d.velocity.x);
	}

	void OnBecameInvisible() {
		transform.position = new Vector3 (-1f,0f,0f);
	}
}
