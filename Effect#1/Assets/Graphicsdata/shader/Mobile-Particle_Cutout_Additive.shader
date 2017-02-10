﻿Shader "Mobile/Particles/Additive_Cutout" {
	Properties{
		_TintColor("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex("Particle Texture", 2D) = "white"
	}

		SubShader{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
		Blend SrcAlpha One
		Cull Off
		Lighting Off
		ZWrite On
		//Fog { color (0,0,0,0) }
		AlphaTest Greater .5
		ColorMask RGB
		BindChannels{
		Bind "Color", color
		Bind "Vertex", vertex
		Bind "TexCoord", texcoord
	}
		Pass{
		SetTexture[_MainTex]{
		constantColor[_TintColor]
		combine constant * primary DOUBLE
	}
		SetTexture[_MainTex]{
		combine previous * texture
	}
	}
	}
}
