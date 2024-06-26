//
//  MissionViews.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI
import SplineRuntime

struct MissionViews: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/n0hKmNcXQ8ekeVcCNWVu/scene.splineswift")!
         ScrollView {
            VStack {
                SplineView(sceneFileURL: url)//.ignoresSafeArea(.all)
                    .frame(height: 500)
                Text("Mission")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Text("The EIH Virtual Immersive Platform is designed to create a dynamic digital twin of our physical facility, skillfully transferring the in-person experience to a virtual space. Blurring the boundaries between physical and virtual environments, this 24/7 accessible digital ecosystem provides premier STEAHM programs to anyone, anywhere. The platform caters to a diverse range of users, including students, educators, communities of practice, institutions, and families, offering interactive learning experiences, toolkits, and resources to enhance teaching methodologies and opportunities to support and participate in educational activities. Our goals are to inspire curiosity, spark creativity and innovation, and showcase career pathways in STEAHM. We aim to evoke possibilities and connect innovation nationally and globally, fostering a creative and tech mindset that accelerates the understanding of technology integration in life and prepares individuals for the future workforce. The platform features a comprehensive repository of digital assets, accessible through various digital mediums, including web and mobile applications, AI assistance, voice technology, and augmented and virtual reality experiences. It offers dynamic content such as videos, images, testimonials, podcasts, and learning activities, and from our physical facility, which includes a state-of-the-art video wall, we will be able to stream content nationwide. Additionally, it provides toolkits and resources for educators, workforce engagement opportunities, and a robust programming schedule with webinars, live-streamed conferences, and weekly online video/podcast chats.")
            }
            .padding(10)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    MissionViews()
}
