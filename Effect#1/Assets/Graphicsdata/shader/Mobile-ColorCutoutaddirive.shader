Shader "Custom/Color CutOut_Additive" 
{
	Properties
	{
		_Color("Main Color", Color) = (1,1,1,1)
		_MainTex("Base (RGB) Trans (A)", 2D) = "white" {}
		_Cutoff("Alpha cutoff", Range(0,1)) = 0.5
		_Glow("glow", Range(-1,1)) = 0.5
	}

		SubShader
	{
		Tags{ "RenderType" = "TransparentCutout" "Queue" = "Transparent " }
		LOD 200
		blend one one
		zwrite on

		CGPROGRAM
#pragma surface surf Lambert alphatest:_Cutoff

		sampler2D _MainTex;
	fixed4 _Color;
	float _Glow;

	struct Input
	{
		float2 uv_MainTex;

	};

	void surf(Input IN, inout SurfaceOutput o)
	{
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
		o.Albedo = c.rgb + _Glow;
		o.Alpha = c.rgb;
	}
	ENDCG
	}

		Fallback "Diffuse"

}