using UnityEngine;
using System.Collections;

public class Delete : MonoBehaviour {
	public float lifeTime = 2.0f;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Destroy (this.gameObject,lifeTime);
	}
}
