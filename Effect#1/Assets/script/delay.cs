using UnityEngine;
using System.Collections;

public class delay : MonoBehaviour {
	public float delayTime = 1.0f;
	// Use this for initialization
	void Start () {
		this.gameObject.SetActive (false);
		Invoke ("Jason", delayTime);
	}
	

	void Jason () {
		this.gameObject.SetActive (true);
	}
}
