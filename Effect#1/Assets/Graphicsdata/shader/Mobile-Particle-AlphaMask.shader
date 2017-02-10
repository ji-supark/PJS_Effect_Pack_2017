// Simplified Alpha Blended Particle shader. Differences from regular Alpha Blended Particle one:
// - no Tint color
// - no Smooth particle support
// - no AlphaTest
// - no ColorMask

Shader "Mobile/Particles/Alpha Blended Mask" {
Properties {
	_MainTex ("Particle Texture", 2D) = "white" {}
	_SubMask("SubMask", 2D) = "SubMask" {}
	_Mask("Mask", 2D) = "Mask" {}
}

Category {
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	Blend SrcAlpha OneMinusSrcAlpha
	Cull Off Lighting Off ZWrite Off Fog { Color (0,0,0,0) }
	ColorMask RGB
	BindChannels {
		Bind "Color", color
		Bind "Vertex", vertex
		Bind "TexCoord", texcoord
	}
	SubShader {
		Pass {
	SetTexture[_Mask]{
	combine texture * primary
}
SetTexture[_SubMask]{
	combine texture * previous DOUBLE
}
SetTexture[_MainTex]{
	combine texture * previous DOUBLE
}
		}
	}
}
}
