using UnityEngine;
using System.Collections;


public class rotation : MonoBehaviour {
	public Vector3 rotatespeed;
	public Vector3 positionspeed;

	void Update () 
	{
		transform.Rotate(rotatespeed * Time.deltaTime);
		transform.Translate(positionspeed * Time.deltaTime);
	}
}
