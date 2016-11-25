using UnityEngine;
using System.Collections;


public class rotation : MonoBehaviour {
	public Vector3 rotatespeed;

	void Update () 
	{
		transform.Rotate(rotatespeed * Time.deltaTime);
	}
}
