using UnityEngine;
using System.Collections;

public class RandAppear : MonoBehaviour {

    public GameObject SpawnTarget;
    public float SpawnRadius = 10.0f;
    public float SpawnDelayTime = 2.0f;
    public int SpawnAmount = 1;
    private int countObject = 0;
    private Vector2 RandRadiusPos;

    void Start () {
 
    }

   IEnumerator SpawnObject()
    {        
        RandRadiusPos = (Random.insideUnitCircle) * SpawnRadius;
        GameObject TempObject = (GameObject)Instantiate(SpawnTarget, new Vector3(RandRadiusPos.x, 0.0f, RandRadiusPos.y), Quaternion.identity);    
        Debug.Log("오브젝트가 " + countObject + "개 생성");
        yield return new WaitForSeconds(SpawnDelayTime);
    }


    // Update is called once per frame
    void Update () {
        if(countObject < SpawnAmount)
        {
            countObject++;
            StartCoroutine(SpawnObject());
        }
      
    }
}
