Shader "Custom/water_rgb" {
	Properties {
		_MainTex ("Base(Main)", 2D) = "white" {}
		_BaseAlphaScroll ("BaseAlphaScroll",Range(-1,1)) = 0.5
		_TintColor ("Tintcolor", color) = (1,1,1,1)
		_ScrollX_r ("r_Xoffset",float) = 1
		_ScrollY_r ("r_Yoffset",float) = 1
		_ScrollXtile_r ("r_tileoffset",float) = 1		
		_Scrolloffset_r ("r_scrolloffset",float) = 0.5
		_TintColor_g ("Tintcolor_g", color) = (1,1,1,1)
		_ScrollX_g ("g_Xoffset",float) = 1
		_ScrollY_g ("g_Yoffset",float) = 1
		_ScrollXtile_g ("g_tileoffset",float) = 1	
		_Scrolloffset_g ("g_scrolloffset",float) = 0.5

	}
	SubShader {
		Tags { "RenderType"="Transparent" "Queue"="Transparent+5000" }
		cull off
		zwrite on
		LOD 200
		
		CGPROGRAM
		#pragma surface surf NoLighting alpha
fixed4 LightingNoLighting(SurfaceOutput s, fixed3 lightDir, fixed atten)
{
fixed4 c;
c.rgb = s.Albedo;
c.a = s.Alpha;
return c;
}
		sampler2D _MainTex;
		sampler2D _MainMask;
		float _ScrollX_r;
		float _ScrollY_r;
		float _Scrolloffset_r;
		float _ScrollXtile_r;
		float _ScrollX_g;
		float _ScrollY_g;
		float _ScrollXtile_g;
		float _Scrolloffset_g;
		float4 _StrokeColor;
		float4 _TintColor_r;
		float4 _TintColor_g;
		float4 _TintColor;
		float _BaseAlphaScroll;

		struct Input {
			float2 uv_MainTex;
			float4 color : COLOR;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex,  float2(IN.uv_MainTex.x*_ScrollXtile_r-_Time.x*_ScrollX_r,IN.uv_MainTex.y*_ScrollXtile_r-_Time.y*-_ScrollY_r));
			half4 d = tex2D (_MainTex, IN.uv_MainTex);
			half4 f = tex2D (_MainTex, IN.uv_MainTex);
			o.Emission = ((c.r * _TintColor_r) + (d.g * _TintColor_g) + (f.b * _TintColor));
			o.Alpha = (((c.r * _Scrolloffset_r * _TintColor_r) + (d.g  * _Scrolloffset_g)) + (f.b))* f.b +_BaseAlphaScroll;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
