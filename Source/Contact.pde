class CustomListener implements ContactListener {
  CustomListener() {
  }

  void beginContact(Contact cp) 
  {
      Body b1 = cp.getFixtureA().getBody();
      Body b2 = cp.getFixtureB().getBody();
      Object o1 = b1.getUserData();
      Object o2 = b2.getUserData();
      if(buttons.get(BALL).properties.get(BOX_KILLER).check)
      {
          if(o1.getClass() == Box.class&&o2.getClass() == Particle.class)
          {
              killed.add(o1);
          } 
          else if(o2.getClass() == Box.class&&o1.getClass() == Particle.class)
          {
              killed.add(o2);
          }
      }
  }

   void endContact(Contact contact) {
    // TODO Auto-generated method stub
  }

   void preSolve(Contact contact, Manifold oldManifold) {
    // TODO Auto-generated method stub
  }

   void postSolve(Contact contact, ContactImpulse impulse) {
    // TODO Auto-generated method stub
  }
}