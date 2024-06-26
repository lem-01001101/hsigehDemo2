//
//  Card.swift
//  HSIDemo4.2
//
//  Created by Magtibay , Leo Jacinto  Malaluan on 6/26/24.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var FeaturedCards = [
    Card(title: "Who It's For", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Card(title: "Goals", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Card(title: "Benefits", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Card(title: "Features", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]

var cards = [
    Card(title: "Who It's For", subtitle: "20 sections - 3 hours", text: "The EIH Virtual Immersive Platform is tailored for a diverse range of users. Students benefit from interactive learning experiences, while educators have access to toolkits and resources that enhance teaching methodologies. It also serves a community of practice, offering a space for collaboration and sharing best practices. Institutions can access cutting-edge educational content, and families are provided with opportunities to support and participate in educational activities.", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Card(title: "Goals", subtitle: "20 sections - 3 hours", text: "The platform aims to inspire and spark curiosity, fostering creativity and innovation while showcasing career pathways in STEAHM. It seeks to evoke possibilities and connect innovation on a national and global scale. By exposing users to a creative and tech-oriented mindset, the platform accelerates their understanding of technology integration in all aspects of life, preparing them for the future workforce. Additionally, it strives to create a sense of belonging, demonstrating that educational institutions can leverage cutting-edge technology to inspire creativity and innovation.", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Card(title: "Benefits", subtitle: "20 sections - 3 hours", text: "The platform offers 24/7 accessibility, ensuring that learning and resources are available anytime and anywhere to everyone. It provides a comprehensive digital ecosystem, including a web application, mobile application, AI assistance technology, voice technology, VR/AR experiences, and a gaming engine for younger audiences. Users can access dynamic content such as videos, images, testimonials, podcasts, and activities that highlight the impact and transformation within the programs. Additionally, a state-of-the-art video wall enables content streaming across the nation, broadening the reach of the programs.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Card(title: "Features", subtitle: "20 sections - 3 hours", text: "The platform offers interactive learning with engaging content that mirrors physical experiences. It includes a centralized resource repository with instructional videos, project designs, images, and testimonials. Community engagement is encouraged, promoting collaboration and sharing among educators, students, and institutions. The platform provides institutional support with tools and resources for implementing and benefiting from STEAM programs. Educator toolkits feature learning tutorials, career paths, frameworks, and access to partner resources from Apple and Autodesk. There are also opportunities for workforce engagement, leveraging technology to connect with workforce partners. Additionally, the platform offers diverse programming, including webinars, live-streamed conferences, weekly online podcast chats in both live and audio formats, and more.", image: "Illustration 2", background: "Background 2", logo: "Logo 3"),
]
