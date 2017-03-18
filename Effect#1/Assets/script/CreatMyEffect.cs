using UnityEngine;
using System.Collections;

public class CreatMyEffect : MonoBehaviour {
	public GameObject myEffect;
	void Jason(){
		Instantiate (myEffect,transform.position,Quaternion.identity);
	}
}
